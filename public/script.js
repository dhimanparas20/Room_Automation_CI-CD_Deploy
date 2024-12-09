// Smooth scrolling for navigation links
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        document.querySelector(this.getAttribute('href')).scrollIntoView({
            behavior: 'smooth'
        });
    });
});

// Add active class to navigation links on scroll
window.addEventListener('scroll', () => {
    let current = '';
    document.querySelectorAll('section').forEach(section => {
        const sectionTop = section.offsetTop;
        if (pageYOffset >= sectionTop - 60) {
            current = section.getAttribute('id');
        }
    });

    document.querySelectorAll('.nav-links a').forEach(link => {
        link.classList.remove('active');
        if (link.getAttribute('href').substring(1) === current) {
            link.classList.add('active');
        }
    });
});

// Background carousel
const backgrounds = [
    'https://cdn.pixabay.com/photo/2021/09/10/22/44/smart-working-6614322_1280.png',
    'https://cdn.pixabay.com/photo/2020/03/05/17/36/smart-home-4905026_1280.jpg',
    'https://images.unsplash.com/photo-1677258523144-a659ca521a07?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
];

const heroBackgrounds = document.querySelectorAll('.hero-background');
let currentBackground = 0;

function changeBackground() {
    heroBackgrounds[currentBackground].style.opacity = 0;
    currentBackground = (currentBackground + 1) % heroBackgrounds.length;
    heroBackgrounds[currentBackground].style.backgroundImage = `linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)), url(${backgrounds[currentBackground]})`;
    heroBackgrounds[currentBackground].style.opacity = 1;
}

// Initialize backgrounds
heroBackgrounds.forEach((bg, index) => {
    bg.style.backgroundImage = `linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)), url(${backgrounds[index]})`;
});
heroBackgrounds[0].style.opacity = 1;

// Change background every 5 seconds
setInterval(changeBackground, 5000);

// Typing animation
const heroText = "Welcome to MST Services";
const heroElement = document.getElementById('hero-text');
let index = 0;

function typeText() {
    if (index < heroText.length) {
        heroElement.innerHTML += heroText.charAt(index);
        index++;
        setTimeout(typeText, 100);
    } else {
        setTimeout(() => {
            heroElement.innerHTML = '';
            index = 0;
            typeText();
        }, 2000);
    }
}

// Start the typing animation
typeText();
