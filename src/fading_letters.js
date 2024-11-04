
document.querySelectorAll("p").forEach(paragraph => {

    const letters = paragraph.textContent.split("");

    paragraph.innerHTML = letters.map(letter => { return letter === " " ? " " : `<span>${letter}</span>`; }).join("");

});

