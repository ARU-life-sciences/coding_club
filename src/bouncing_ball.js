
import * as d3 from "https://cdn.jsdelivr.net/npm/d3@7/+esm";

const bound = (value, min, max) => {
    if (isNaN(value)) {
        return 0;
    }
    if (value < min) {
        return min;
    }
    if (value > max) {
        return max;
    }
    return value;
}

const maxVelocity = 60;
const minVelocity = 5;
const velocityDivisor = 50;
const margin = 10;
const radius = 20;
const drawInterval = 1;
const ballColor = "#2A2A72";
const height = window.screen.width;
const width = window.screen.width;

const randBetween = (min, max) => {
    const range = max - min;
    return min + range * Math.random();
}

let angle = randBetween(0, Math.PI);
console.log("The angle is: " + angle);
let diff = {
    x: Math.cos(angle),
    y: Math.sin(angle)
};

let velocity = 20;

const svg = d3.select('#Ball').append('svg')
    .attr('width', width)
    .attr('height', height);

const defs = svg.append("defs");

defs.append("marker")
    .attr("markerWidth", 10)
    .attr("markerHeight", 10)
    .attr("refX", 10)
    .attr("refY", 5)
    .attr("orient", "auto")
    .append("path")
    .attr("d", "M10,0 L10,10 L0,5 Z")
    .attr("fill", ballColor);

let surface = svg.append("rect")
    .classed("surface", true)
    .attr("fill", "#ffffff")
    .attr("x", margin)
    .attr("y", margin)
    .attr("width", "100%")
    .attr("height", "100%")
    .style("position", "absolute")  
    .style("top", 0)
    .style("left", 0);

const ball = svg.append("circle")
    .attr("fill", ballColor)
    .attr("cx", width / 2)
    .attr("cy", height / 2)
    .attr("r", radius);

const line = svg.append("line")
    .attr("stroke", ballColor)
    .attr("stroke-width", 0);

function move(xy, max) {
    return function () {
        let current = +d3.select(this).attr(`c${xy}`);
        let next = current + velocity * diff[xy];
        if (next < margin + radius || next > max - margin - radius) {
            diff[xy] *= -1;
        }
        return next;
    };
}

let interval = setInterval(() => {
    ball.attr("cx", move("x", width))
        .attr("cy", move("y", height));
}, drawInterval);

let startDragPos = { x: 0, y: 0 };

let drag = d3.drag()
    .on("start", (event) => {
        diff = { x: 0, y: 0 };
        startDragPos = {
            x: bound(event.x, margin + radius, width - margin - radius),
            y: bound(event.y, margin + radius, height - margin - radius)
        };
        ball.attr("cx", startDragPos.x)
            .attr("cy", startDragPos.y);
        line.attr("stroke-width", 2)
            .attr("x1", startDragPos.x)
            .attr("y1", startDragPos.y)
            .attr("x2", startDragPos.x)
            .attr("y2", startDragPos.y);
    })
    .on("drag", (event) => {
        let pos = {
            x: bound(event.x, margin + radius, width - margin - radius),
            y: bound(event.y, margin + radius, height - margin - radius)
        };
        ball.attr("cx", pos.x)
            .attr("cy", pos.y);
        line.attr("x2", pos.x)
            .attr("y2", pos.y);
    })
    .on("end", (event) => {
        let delta = {
            x: event.x - startDragPos.x,
            y: event.y - startDragPos.y
        };
        let angle = Math.atan2(delta.y, delta.x) + Math.PI;
        diff = {
            x: Math.cos(angle),
            y: Math.sin(angle)
        };
        velocity = bound(Math.sqrt(Math.pow(delta.x, 2) + Math.pow(delta.y, 2)) / velocityDivisor, minVelocity, maxVelocity);
        ball.attr("cx", bound(event.x, margin + radius, width - margin - radius))
            .attr("cy", bound(event.y, margin + radius, height - margin - radius));
        line.attr("stroke-width", 0)
            .attr("x1", 0)
            .attr("y1", 0)
            .attr("x2", 0)
            .attr("y2", 0);
        startDragPos = { x: 0, y: 0 };
    });

surface.call(drag);
d3.select("#Ball").append(svg);

