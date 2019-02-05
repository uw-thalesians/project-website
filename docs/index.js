

function hashHandler() {

    if (location.hash === '#code') {
        document.getElementById("code").classList.remove("d-none");
        document.getElementById("code").focus();
        document.getElementById("perceptia").classList.add("d-none");
        document.getElementById("team").classList.add("d-none")
    } else if (location.hash ==='#team') {
        document.getElementById("team").classList.remove("d-none");
        document.getElementById("team").focus();
        document.getElementById("perceptia").classList.add("d-none");
        document.getElementById("code").classList.add("d-none");
    } else {
        document.getElementById("perceptia").classList.remove("d-none");
        document.getElementById("perceptia").focus();
        document.getElementById("team").classList.add("d-none");
        document.getElementById("code").classList.add("d-none");
    }
}

window.addEventListener("hashchange", hashHandler, false);