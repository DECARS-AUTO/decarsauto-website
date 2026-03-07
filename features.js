// DecarsAuto - Additional Features
// Mobile menu, dark mode, contact form, and back to top button

// ======================
// 初始化日志 - 仅在控制台显示
// ======================
console.group('🚀 DecarsAuto 功能模块');
console.log('📅 加载时间:', new Date().toLocaleString('zh-CN'));
console.log('🌐 当前语言:', document.documentElement.lang);
console.log('📱 设备类型:', /Mobile|Android|iPhone/i.test(navigator.userAgent) ? '移动设备' : '桌面设备');
console.groupEnd();

// ======================
// Scroll Effects - Header Shadow
// ======================
function initScrollEffects() {
    console.log('✅ 滚动效果已初始化');
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
    console.log('✅ 滚动动画观察器已初始化');
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
                    console.log('🎨 动画触发:', entry.target.className);
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

    console.log('📦 发现', animatedElements.length, '个可动画元素');
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
    console.log('✅ 移动菜单已初始化');
    const menuToggle = document.getElementById('mobile-menu-toggle');
    const mobileMenu = document.getElementById('mobile-menu');

    if (!menuToggle || !mobileMenu) return;

    menuToggle.addEventListener('click', () => {
        menuToggle.classList.toggle('active');
        mobileMenu.classList.toggle('active');
        console.log('📱 移动菜单', mobileMenu.classList.contains('active') ? '已打开' : '已关闭');
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
// Dark Mode - DISABLED
// ======================
// Dark mode functionality has been disabled
// function initDarkMode() {
//     const prefersDarkScheme = window.matchMedia('(prefers-color-scheme: dark)');
//     function applyDarkMode(isDark) {
//         if (isDark) {
//             document.body.classList.add('dark-mode');
//         } else {
//             document.body.classList.remove('dark-mode');
//         }
//     }
//     applyDarkMode(prefersDarkScheme.matches);
//     prefersDarkScheme.addEventListener('change', (e) => {
//         applyDarkMode(e.matches);
//     });
// }

// ======================
// Contact Form
// ======================
function initContactForm() {
    console.log('✅ 联系表单已初始化');
    const form = document.getElementById('contact-form');
    const formStatus = document.getElementById('form-status');

    if (!form) return;

    form.addEventListener('submit', async (e) => {
        e.preventDefault();

        console.log('📧 用户提交联系表单');

        const formData = {
            name: document.getElementById('form-name').value,
            email: document.getElementById('form-email').value,
            phone: document.getElementById('form-phone').value || 'N/A',
            vehicle: document.getElementById('form-vehicle').value || 'N/A',
            service: document.getElementById('form-service').value,
            message: document.getElementById('form-message').value
        };

        console.log('📝 表单数据:', {
            '姓名': formData.name,
            '邮箱': formData.email,
            '车型': formData.vehicle,
            '服务': formData.service
        });

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

            console.log('✉️ 正在打开邮件客户端...');

            // Open email client
            window.location.href = mailtoLink;

            // Show success message
            formStatus.className = 'form-status success';
            formStatus.textContent = 'Your email client has been opened. Please send the pre-filled email.';
            form.reset();

            console.log('✅ 表单提交成功');

            // Reset button after delay
            setTimeout(() => {
                submitBtn.disabled = false;
                submitBtn.innerHTML = originalText;
                formStatus.style.display = 'none';
            }, 5000);

        } catch (error) {
            console.error('❌ 表单提交错误:', error);
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
    console.log('✅ 返回顶部按钮已初始化');
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
        console.log('⬆️ 用户点击返回顶部');
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
    console.group('🎯 DecarsAuto 功能初始化开始');
    try {
        initScrollEffects();       // NEW: Header scroll effects
        initScrollAnimations();    // NEW: Fade-in animations
        initMobileMenu();
        // initDarkMode();          // DISABLED: 深色模式已禁用
        initContactForm();
        initBackToTop();

        console.log('✅ 所有功能模块加载完成');
        console.groupEnd();

        // 性能监控
        console.log('⏱️ 页面性能指标:');
        window.addEventListener('load', () => {
            const perfData = performance.getEntriesByType('navigation')[0];
            if (perfData) {
                console.log('  📊 DOM 加载:', Math.round(perfData.domContentLoadedEventEnd - perfData.domContentLoadedEventStart), 'ms');
                console.log('  📊 页面完全加载:', Math.round(perfData.loadEventEnd - perfData.loadEventStart), 'ms');
                console.log('  📊 总加载时间:', Math.round(perfData.loadEventEnd - perfData.fetchStart), 'ms');
            }
        });

    } catch (err) {
        console.error('❌ 功能初始化失败:', err);
        console.groupEnd();
    }
}

// Run when DOM is ready
if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initNewFeatures);
} else {
    initNewFeatures();
}
