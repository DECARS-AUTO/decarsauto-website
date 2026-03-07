// DecarsAuto - Additional Features
// Mobile menu, dark mode, contact form, and back to top button

// ======================
// Scroll Effects - Header Shadow
// ======================
function initScrollEffects() {
    const header = document.querySelector('header');
    if (!header) return;

    let lastScroll = 0;

    window.addEventListener('scroll', () => {
        const currentScroll = window.pageYOffset;

        // Add scrolled class when scrolling down
        if (currentScroll > 50) {
            header.classList.add('scrolled');
        } else {
            header.classList.remove('scrolled');
        }

        lastScroll = currentScroll;
    });
}

// ======================
// Intersection Observer - Fade In Animations
// ======================
function initScrollAnimations() {
    const observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    };

    const observer = new IntersectionObserver((entries) => {
        entries.forEach((entry, index) => {
            if (entry.isIntersecting) {
                setTimeout(() => {
                    entry.target.style.opacity = '1';
                    entry.target.style.transform = 'translateY(0)';
                }, index * 100);
                observer.unobserve(entry.target);
            }
        });
    }, observerOptions);

    // Observe all cards and sections
    const animatedElements = document.querySelectorAll(`
        .vehicle-card,
        .service-card,
        .workflow-step,
        .trust-item
    `);

    animatedElements.forEach((el, index) => {
        el.style.opacity = '0';
        el.style.transform = 'translateY(30px)';
        el.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
        observer.observe(el);
    });
}

// ======================
// Mobile Menu
// ======================
function initMobileMenu() {
    const menuToggle = document.getElementById('mobile-menu-toggle');
    const mobileMenu = document.getElementById('mobile-menu');
    
    if (!menuToggle || !mobileMenu) return;
    
    menuToggle.addEventListener('click', () => {
        menuToggle.classList.toggle('active');
        mobileMenu.classList.toggle('active');
    });
    
    // Close menu when clicking outside
    document.addEventListener('click', (e) => {
        if (!menuToggle.contains(e.target) && !mobileMenu.contains(e.target)) {
            menuToggle.classList.remove('active');
            mobileMenu.classList.remove('active');
        }
    });
    
    // Close menu when clicking a link
    const mobileLinks = mobileMenu.querySelectorAll('a');
    mobileLinks.forEach(link => {
        link.addEventListener('click', () => {
            menuToggle.classList.remove('active');
            mobileMenu.classList.remove('active');
        });
    });
}

// ======================
// Dark Mode - Auto System Detection
// ======================
function initDarkMode() {
    // Check system preference
    const prefersDarkScheme = window.matchMedia('(prefers-color-scheme: dark)');

    // Function to apply dark mode based on system preference
    function applyDarkMode(isDark) {
        if (isDark) {
            document.body.classList.add('dark-mode');
        } else {
            document.body.classList.remove('dark-mode');
        }
    }

    // Apply initial theme based on system preference
    applyDarkMode(prefersDarkScheme.matches);

    // Listen for system theme changes and apply automatically
    prefersDarkScheme.addEventListener('change', (e) => {
        applyDarkMode(e.matches);
    });
}

// ======================
// Contact Form
// ======================
function initContactForm() {
    const form = document.getElementById('contact-form');
    const formStatus = document.getElementById('form-status');
    
    if (!form) return;
    
    form.addEventListener('submit', async (e) => {
        e.preventDefault();
        
        const formData = {
            name: document.getElementById('form-name').value,
            email: document.getElementById('form-email').value,
            phone: document.getElementById('form-phone').value || 'N/A',
            vehicle: document.getElementById('form-vehicle').value || 'N/A',
            service: document.getElementById('form-service').value,
            message: document.getElementById('form-message').value
        };
        
        // Show loading state
        const submitBtn = form.querySelector('button[type="submit"]');
        const originalText = submitBtn.innerHTML;
        submitBtn.disabled = true;
        submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> <span>Sending...</span>';
        
        try {
            // Create mailto link as fallback
            const emailBody = `
Name: ${formData.name}
Email: ${formData.email}
Phone: ${formData.phone}
Vehicle Model: ${formData.vehicle}
Service Needed: ${formData.service}

Message:
${formData.message}
            `.trim();
            
            const mailtoLink = `mailto:shimingjie@decarsauto.de?subject=Service Request from ${formData.name}&body=${encodeURIComponent(emailBody)}`;
            
            // Open email client
            window.location.href = mailtoLink;
            
            // Show success message
            formStatus.className = 'form-status success';
            formStatus.textContent = 'Your email client has been opened. Please send the pre-filled email.';
            form.reset();
            
            // Reset button after delay
            setTimeout(() => {
                submitBtn.disabled = false;
                submitBtn.innerHTML = originalText;
                formStatus.style.display = 'none';
            }, 5000);
            
        } catch (error) {
            console.error('Form submission error:', error);
            formStatus.className = 'form-status error';
            formStatus.textContent = 'Failed to open email client. Please contact us directly at shimingjie@decarsauto.de';
            
            submitBtn.disabled = false;
            submitBtn.innerHTML = originalText;
        }
    });
}

// ======================
// Back to Top Button
// ======================
function initBackToTop() {
    const backToTopBtn = document.getElementById('back-to-top');
    
    if (!backToTopBtn) return;
    
    window.addEventListener('scroll', () => {
        if (window.pageYOffset > 300) {
            backToTopBtn.classList.add('visible');
        } else {
            backToTopBtn.classList.remove('visible');
        }
    });
    
    backToTopBtn.addEventListener('click', () => {
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    });
}

// ======================
// Initialize New Features
// ======================
function initNewFeatures() {
    try {
        initScrollEffects();       // NEW: Header scroll effects
        initScrollAnimations();    // NEW: Fade-in animations
        initMobileMenu();
        initDarkMode();
        initContactForm();
        initBackToTop();

        console.log('[DecarsAuto Features] All features initialized with animations');
    } catch (err) {
        console.error('[DecarsAuto Features] Initialization failed', err);
    }
}

// Run when DOM is ready
if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initNewFeatures);
} else {
    initNewFeatures();
}
