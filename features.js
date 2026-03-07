// DecarsAuto - Additional Features
// Mobile menu, dark mode, contact form, and back to top button

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
        initMobileMenu();
        initDarkMode();
        initContactForm();
        initBackToTop();
        
        console.log('[DecarsAuto Features] All new features initialized');
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
