// DecarsAuto - UI Enhancements
// Back to top button and scroll animations

// ======================
// Back to Top Button
// ======================
(function initBackToTop() {
    function init() {
        const backToTopBtn = document.getElementById('back-to-top');
        if (!backToTopBtn) return;
        
        // Show/hide button based on scroll position
        window.addEventListener('scroll', () => {
            if (window.pageYOffset > 300) {
                backToTopBtn.classList.add('visible');
            } else {
                backToTopBtn.classList.remove('visible');
            }
        });
        
        // Smooth scroll to top on click
        backToTopBtn.addEventListener('click', () => {
            window.scrollTo({
                top: 0,
                behavior: 'smooth'
            });
        });
    }
    
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', init);
    } else {
        init();
    }
})();

// ======================
// Scroll Animations
// ======================
(function initScrollAnimations() {
    function init() {
        // Add fade-in class to animated elements
        // Note: Exclude .vehicle-card from brands section to show logos immediately
        const animatedElements = document.querySelectorAll(
            '.service-card, .workflow-step, .trust-item, .contact-card'
        );
        animatedElements.forEach(el => {
            el.classList.add('fade-in');
        });

        // Intersection Observer for fade-in animations
        const observerOptions = {
            threshold: 0.1,
            rootMargin: '0px 0px -50px 0px'
        };

        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('visible');
                    // Stop observing after animation to improve performance
                    observer.unobserve(entry.target);
                }
            });
        }, observerOptions);

        // Observe all fade-in elements
        document.querySelectorAll('.fade-in').forEach(el => {
            observer.observe(el);
        });

        console.log('[DecarsAuto] Scroll animations initialized (logos excluded for immediate display)');
    }

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', init);
    } else {
        init();
    }
})();

// ======================
// Lazy Loading Images
// ======================
(function initLazyLoading() {
    function init() {
        // Add loading="lazy" to images that don't have it
        const images = document.querySelectorAll('img:not([loading])');
        images.forEach(img => {
            // Skip logo and critical images
            if (!img.closest('header') && !img.classList.contains('logo-image')) {
                img.setAttribute('loading', 'lazy');
            }
        });

        console.log('[DecarsAuto] Lazy loading initialized for', images.length, 'images');
    }

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', init);
    } else {
        init();
    }
})();

// ======================
// Smooth Scroll Enhancement
// ======================
(function enhanceSmoothScroll() {
    function init() {
        // Add smooth scroll behavior to the document
        document.documentElement.style.scrollBehavior = 'smooth';

        // Handle anchor links
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function(e) {
                const href = this.getAttribute('href');

                // Skip if it's just "#" or special links
                if (href === '#' || href.includes('cookie-settings')) return;

                const target = document.querySelector(href);
                if (target) {
                    e.preventDefault();

                    // Offset for fixed header if exists
                    const headerOffset = 80;
                    const elementPosition = target.getBoundingClientRect().top;
                    const offsetPosition = elementPosition + window.pageYOffset - headerOffset;

                    window.scrollTo({
                        top: offsetPosition,
                        behavior: 'smooth'
                    });
                }
            });
        });

        console.log('[DecarsAuto] Smooth scroll enhanced');
    }

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', init);
    } else {
        init();
    }
})();

// ======================
// Performance Monitoring
// ======================
(function monitorPerformance() {
    if (window.performance && window.performance.timing) {
        window.addEventListener('load', () => {
            setTimeout(() => {
                const perfData = window.performance.timing;
                const pageLoadTime = perfData.loadEventEnd - perfData.navigationStart;
                const connectTime = perfData.responseEnd - perfData.requestStart;
                const renderTime = perfData.domComplete - perfData.domLoading;

                console.log('[DecarsAuto] Performance Metrics:', {
                    pageLoadTime: pageLoadTime + 'ms',
                    connectTime: connectTime + 'ms',
                    renderTime: renderTime + 'ms'
                });
            }, 0);
        });
    }
})();
