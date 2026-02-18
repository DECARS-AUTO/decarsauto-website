// DecarsAuto - Main JavaScript
// Language switcher, translations, cookie banner

// ======================
// Translations
// ======================
const translations = {
    en: {
        'logo-tagline': 'Focused on VAG online programming and remote technical support',
        'nav-services': 'Services',
        'nav-workflow': 'Workflow',
        'nav-brands': 'Brands',
        'nav-contact': 'Contact',
        'hero-title': 'DecarsAuto - Worldwide Remote VAG Control Unit Programming',
        'hero-subhead': '24/7 Remote Service - Quote after assessment - AnyDesk / TeamViewer / ToDesk / UltraViewer',
        'cta-whatsapp': 'WhatsApp',
        'cta-telegram': 'Telegram',
        'link-call': 'Call',
        'link-template': 'Copy request template',
        'brands-title': 'Supported Brands',
        'services-title': 'Core Services',
        'service1-title': 'Remote Diagnostics & Assessment',
        'service1-desc': 'Remote diagnosis - Feasibility check - Risk analysis',
        'service2-title': 'Coding & Parameterization',
        'service2-desc': 'Coding - Parameterization - Customization',
        'service3-title': 'ECU/TCU & System Modules',
        'service3-desc': 'Engine - Transmission - Gateway - Body - Instrument cluster - Infotainment',
        'service4-title': 'Performance-related Work',
        'service4-desc': 'Performance tuning - Within legal & usage boundaries',
        'service5-title': 'Emissions-related Work',
        'service5-desc': 'Emissions work - Regulatory compliance - No non-compliant requests',
        'service6-title': 'Recovery & Restore',
        'service6-desc': 'Recovery - Rescue - Rollback',
        'workflow-title': 'Remote Workflow',
        'step1-title': 'Submit Information',
        'step1-desc': 'Vehicle model - Year - Region - Goal - Logs',
        'step2-title': 'Assessment & Quote',
        'step2-desc': 'Confirm risk - Duration - Usage boundaries',
        'step3-title': 'Remote Implementation',
        'step3-desc': 'AnyDesk - TeamViewer - ToDesk - UltraViewer',
        'step4-title': 'Delivery & Validation',
        'step4-desc': 'Report - Recommendations - Follow-up support',
        'trust-title': 'Trust',
        'trust1-title': 'VAG Brand Experience',
        'trust1-desc': 'Comprehensive experience with all VAG brands and control units',
        'trust2-title': 'Traceable Process',
        'trust2-desc': 'Documented workflow with backup and verification',
        'trust3-title': 'Remote Security',
        'trust3-desc': 'Secure tools and encrypted connections',
        'trust4-title': '24/7 Support',
        'trust4-desc': 'Worldwide availability through multiple channels',
        'contact-title': 'Contact',
        'contact-whatsapp-handle': 'Chat with us',
        'contact-telegram-handle': 'Chat with us',
        'contact-email-handle': 'Send an email',
        'contact-phone-handle': 'Call us',
        'contact-phone': 'Phone',
        'footer-impressum': 'Impressum',
        'footer-privacy': 'Privacy Policy',
        'footer-cookie-settings': 'Cookie Settings',
        'footer-rights': 'All rights reserved.',
        'cookie-title': 'Cookies & Privacy',
        'cookie-text': 'We use cookies and similar technologies to ensure basic site functionality and, with your consent, to measure traffic (Matomo / Google Analytics).',
        'cookie-necessary': 'Necessary:',
        'cookie-necessary-desc': 'required for the website to function (always on)',
        'cookie-analytics': 'Analytics:',
        'cookie-analytics-desc': 'helps us understand usage to improve the site (optional)',
        'cookie-accept-all': 'Accept all',
        'cookie-reject': 'Reject non-essential',
        'cookie-customize': 'Customize',
        'cookie-privacy-link': 'Privacy Policy'
    },
    de: {
        'logo-tagline': 'Focused on VAG online programming and remote technical support',
        'nav-services': 'Leistungen',
        'nav-workflow': 'Ablauf',
        'nav-brands': 'Marken',
        'nav-contact': 'Kontakt',
        'hero-title': 'DecarsAuto - Worldwide Remote VAG Control Unit Programming',
        'hero-subhead': '24/7 Remote-Service - Angebot nach Bewertung - AnyDesk / TeamViewer / ToDesk / UltraViewer',
        'cta-whatsapp': 'WhatsApp',
        'cta-telegram': 'Telegram',
        'link-call': 'Anrufen',
        'link-template': 'Anfragevorlage kopieren',
        'brands-title': 'Supported Brands',
        'services-title': 'Kernleistungen',
        'service1-title': 'Ferndiagnose & Bewertung',
        'service1-desc': 'Remote diagnosis - Feasibility check - Risk analysis',
        'service2-title': 'Codierung & Parametrierung',
        'service2-desc': 'Codierung - Parametrierung - Anpassung',
        'service3-title': 'ECU/TCU & Systemmodule',
        'service3-desc': 'Motor - Getriebe - Gateway - Karosserie - Kombiinstrument - Infotainment',
        'service4-title': 'Leistungsbezogene Arbeiten',
        'service4-desc': 'Leistungsoptimierung - Im rechtlichen & Nutzungsrahmen',
        'service5-title': 'Emissionsbezogene Arbeiten',
        'service5-desc': 'Emissionsarbeiten - Gesetzeskonformit?t - Keine nicht-konformen Anfragen',
        'service6-title': 'Wiederherstellung & Restore',
        'service6-desc': 'Wiederherstellung - Rettung - Rollback',
        'workflow-title': 'Remote-Ablauf',
        'step1-title': 'Submit Information',
        'step1-desc': 'Fahrzeugmodell - Baujahr - Region - Ziel - Logs',
        'step2-title': 'Bewertung & Angebot',
        'step2-desc': 'Confirm risk - Duration - Usage boundaries',
        'step3-title': 'Remote Implementation',
        'step3-desc': 'AnyDesk - TeamViewer - ToDesk - UltraViewer',
        'step4-title': 'Delivery & Validation',
        'step4-desc': 'Bericht - Empfehlungen - Nachbetreuung',
        'trust-title': 'Vertrauen',
        'trust1-title': 'VAG-Markenerfahrung',
        'trust1-desc': 'Comprehensive experience with all VAG brands and control units',
        'trust2-title': 'Nachvollziehbarer Prozess',
        'trust2-desc': 'Dokumentierter Workflow mit Backup und Verifizierung',
        'trust3-title': 'Remote-Sicherheit',
        'trust3-desc': 'Secure tools and encrypted connections',
        'trust4-title': '24/7 Support',
        'trust4-desc': 'Worldwide availability through multiple channels',
        'contact-title': 'Kontakt',
        'contact-whatsapp-handle': 'Chat mit uns',
        'contact-telegram-handle': 'Chat mit uns',
        'contact-email-handle': 'E-Mail senden',
        'contact-phone-handle': 'Anrufen',
        'contact-phone': 'Telefon',
        'footer-impressum': 'Impressum',
        'footer-privacy': 'Privacy Policy',
        'footer-cookie-settings': 'Cookie-Einstellungen',
        'footer-rights': 'Alle Rechte vorbehalten.',
        'cookie-title': 'Cookies & Datenschutz',
        'cookie-text': 'We use cookies and similar technologies to ensure basic site functionality and, with your consent, to measure traffic (Matomo / Google Analytics).',
        'cookie-necessary': 'Notwendig:',
        'cookie-necessary-desc': 'required for the website to function (always on)',
        'cookie-analytics': 'Analyse:',
        'cookie-analytics-desc': 'hilft uns, die Nutzung zu verstehen und die Website zu verbessern (optional)',
        'cookie-accept-all': 'Alle akzeptieren',
        'cookie-reject': 'Nicht-essenzielle ablehnen',
        'cookie-customize': 'Anpassen',
        'cookie-privacy-link': 'Datenschutzerkl?rung'
    },
    // NOTE: zh translations are injected from `index.html` via `window.__INLINE_TRANSLATIONS__`
    // to avoid mojibake when the server serves `script.js` with a wrong charset.
    zh: {
        'logo-tagline': 'VAG online programming & remote support',
        'nav-services': 'Services',
        'nav-workflow': 'Workflow',
        'nav-brands': 'Brands',
        'nav-contact': 'Contact',
        'hero-title': 'DecarsAuto - Worldwide Remote VAG Control Unit Programming',
        'hero-subhead': '24/7 Remote Service - Quote after assessment - AnyDesk / TeamViewer / ToDesk / UltraViewer',
        'cta-whatsapp': 'WhatsApp',
        'cta-telegram': 'Telegram',
        'link-call': 'Call',
        'link-template': 'Copy request template',
        'brands-title': 'Supported Brands',
        'services-title': 'Core Services',
        'service1-title': 'Remote Diagnostics & Assessment',
        'service1-desc': 'Remote diagnosis - Feasibility check - Risk analysis',
        'service2-title': 'Coding & Parameterization',
        'service2-desc': 'Coding - Parameterization - Customization',
        'service3-title': 'ECU/TCU & System Modules',
        'service3-desc': 'Engine - Transmission - Gateway - Body - Instrument cluster - Infotainment',
        'service4-title': 'Performance-related Work',
        'service4-desc': 'Performance tuning - Within legal & usage boundaries',
        'service5-title': 'Emissions-related Work',
        'service5-desc': 'Emissions work - Regulatory compliance - No non-compliant requests',
        'service6-title': 'Recovery & Restore',
        'service6-desc': 'Recovery - Rescue - Rollback',
        'workflow-title': 'Remote Workflow',
        'step1-title': 'Submit Information',
        'step1-desc': 'Vehicle model - Year - Region - Goal - Logs',
        'step2-title': 'Assessment & Quote',
        'step2-desc': 'Confirm risk - Duration - Usage boundaries',
        'step3-title': 'Remote Implementation',
        'step3-desc': 'AnyDesk - TeamViewer - ToDesk - UltraViewer',
        'step4-title': 'Delivery & Validation',
        'step4-desc': 'Report - Recommendations - Follow-up support',
        'trust-title': 'Trust',
        'trust1-title': 'VAG Brand Experience',
        'trust1-desc': 'Comprehensive experience with all VAG brands and control units',
        'trust2-title': 'Traceable Process',
        'trust2-desc': 'Documented workflow with backup and verification',
        'trust3-title': 'Remote Security',
        'trust3-desc': 'Secure tools and encrypted connections',
        'trust4-title': '24/7 Support',
        'trust4-desc': 'Worldwide availability through multiple channels',
        'contact-title': 'Contact',
        'contact-phone': 'Phone',
        'footer-impressum': 'Impressum',
        'footer-privacy': 'Privacy Policy',
        'footer-cookie-settings': 'Cookie Settings',
        'footer-rights': 'All rights reserved.',
        'cookie-title': 'Cookies & Privacy',
        'cookie-text': 'We use cookies and similar technologies to ensure basic site functionality and, with your consent, to measure traffic (Matomo / Google Analytics).',
        'cookie-necessary': 'Necessary:',
        'cookie-necessary-desc': 'required for the website to function (always on)',
        'cookie-analytics': 'Analytics:',
        'cookie-analytics-desc': 'helps us understand usage to improve the site (optional)',
        'cookie-accept-all': 'Accept all',
        'cookie-reject': 'Reject non-essential',
        'cookie-customize': 'Customize',
        'cookie-privacy-link': 'Privacy Policy'
    }
};

// If the page provides inline translations (UTF-8 from HTML), merge them in.
// This helps when the server serves `script.js` with a wrong charset.
try {
    if (typeof window !== 'undefined' && window.__INLINE_TRANSLATIONS__) {
        for (const [lang, dict] of Object.entries(window.__INLINE_TRANSLATIONS__)) {
            translations[lang] = Object.assign({}, translations[lang] || {}, dict);
        }
    }
} catch (_) {
    // ignore
}

// Backward-compatible globals for existing test pages
function changeLanguage(lang) {
    setLanguage(lang);
}

// ======================
// Language Management
// ======================
let currentLanguage = localStorage.getItem('language') || 'en';

function setLanguage(lang) {
    currentLanguage = lang;
    currentLang = lang;
    localStorage.setItem('language', lang);
    
    // Update all translatable elements
    document.querySelectorAll('[data-translate]').forEach(element => {
        const key = element.getAttribute('data-translate');
        if (translations[lang] && translations[lang][key]) {
            element.textContent = translations[lang][key];
        }
    });
    
    // Update current language display
    const currentLangDisplay = document.getElementById('current-lang');
    if (currentLangDisplay) {
        currentLangDisplay.textContent = lang.toUpperCase();
    }
    
    // Update active language option
    document.querySelectorAll('.lang-option').forEach(option => {
        option.classList.remove('active');
        if (option.getAttribute('data-lang') === lang) {
            option.classList.add('active');
        }
    });
}

// ======================
// Language Switcher
// ======================
function initLanguageSwitcher() {
    const dropdownBtn = document.getElementById('lang-dropdown-btn');
    const dropdownMenu = document.getElementById('lang-dropdown-menu');
    const langOptions = document.querySelectorAll('.lang-option');
    
    if (!dropdownBtn || !dropdownMenu) return;
    
    // Toggle dropdown
    dropdownBtn.addEventListener('click', (e) => {
        e.stopPropagation();
        const isOpen = dropdownMenu.classList.toggle('show');
        dropdownBtn.classList.toggle('active', isOpen);
    });
    
    // Language selection
    langOptions.forEach(option => {
        option.addEventListener('click', (e) => {
            e.stopPropagation();
            const lang = option.getAttribute('data-lang');
            setLanguage(lang);
            dropdownMenu.classList.remove('show');
            dropdownBtn.classList.remove('active');
        });
    });
    
    // Close dropdown when clicking outside
    document.addEventListener('click', (e) => {
        if (!dropdownMenu.contains(e.target) && !dropdownBtn.contains(e.target)) {
            dropdownMenu.classList.remove('show');
            dropdownBtn.classList.remove('active');
        }
    });
}

// Keep simple string mirror used by old debug helpers
let currentLang = currentLanguage;

// ======================
// Cookie Management
// ======================
function getCookie(name) {
    const value = `; ${document.cookie}`;
    const parts = value.split(`; ${name}=`);
    if (parts.length === 2) return parts.pop().split(';').shift();
}

function setCookie(name, value, days) {
    const expires = new Date();
    expires.setTime(expires.getTime() + days * 24 * 60 * 60 * 1000);
    document.cookie = `${name}=${value};expires=${expires.toUTCString()};path=/;SameSite=Lax`;
}

function showCookieBanner() {
    const banner = document.getElementById('cookie-banner');
    if (banner) {
        banner.style.display = 'block';
    }
}

function hideCookieBanner() {
    const banner = document.getElementById('cookie-banner');
    if (banner) {
        banner.style.display = 'none';
    }
}

function initCookieBanner() {
    const cookieConsent = getCookie('cookie_consent');
    
    if (!cookieConsent) {
        showCookieBanner();
    }
    
    // Accept all cookies
    const acceptBtn = document.getElementById('cookie-accept-all');
    if (acceptBtn) {
        acceptBtn.addEventListener('click', () => {
            setCookie('cookie_consent', 'accepted', 365);
            setCookie('cookie_analytics', 'true', 365);
            hideCookieBanner();
            loadAnalytics();
        });
    }
    
    // Reject non-essential cookies
    const rejectBtn = document.getElementById('cookie-reject');
    if (rejectBtn) {
        rejectBtn.addEventListener('click', () => {
            setCookie('cookie_consent', 'rejected', 365);
            setCookie('cookie_analytics', 'false', 365);
            hideCookieBanner();
        });
    }
    
    // Customize cookies
    const customizeBtn = document.getElementById('cookie-customize');
    if (customizeBtn) {
        customizeBtn.addEventListener('click', () => {
            alert('Cookie customization panel would open here. For now, use Accept or Reject.');
        });
    }
    
    // Cookie settings link in footer
    const settingsLink = document.getElementById('cookie-settings-link');
    if (settingsLink) {
        settingsLink.addEventListener('click', (e) => {
            e.preventDefault();
            showCookieBanner();
        });
    }
}

function loadAnalytics() {
    const analyticsConsent = getCookie('cookie_analytics');
    if (analyticsConsent === 'true') {
        // Load analytics scripts here
        console.log('Analytics loaded');
        // Example: Load Google Analytics or Matomo
    }
}

// ======================
// Copy Template
// ======================
function initCopyTemplate() {
    const copyTemplateLink = document.querySelector('.copy-template');
    if (copyTemplateLink) {
        copyTemplateLink.addEventListener('click', (e) => {
            e.preventDefault();
            copyTemplate();
        });
    }
}

function copyTemplate() {
    const template = `DecarsAuto Remote Service Request

Vehicle Information:
- Brand: [Volkswagen/Audi/?koda/SEAT/Bentley/Lamborghini/Bugatti]
- Model: [e.g., Golf 8, A4 B9, Octavia]
- Year: [e.g., 2020]
- Region: [e.g., Europe, USA, China]
- VIN: [optional]

Request Details:
- Service needed: [Coding/Programming/Diagnostics/Recovery]
- Goal: [describe what you want to achieve]
- Current issue: [if applicable]
- Diagnostic logs: [attach if available]

Remote Access:
- Preferred tool: [AnyDesk/TeamViewer/ToDesk/UltraViewer]
- Availability: [your timezone and preferred time]

Contact:
- Name: 
- Phone/WhatsApp: 
- Email: 

Please send to:
WhatsApp: +86 133 0536 9650
Telegram: @Decars_Auto
Email: shimingjie@decarsauto.de`;

    navigator.clipboard.writeText(template).then(() => {
        alert('Request template copied to clipboard!');
    }).catch(err => {
        console.error('Failed to copy:', err);
        alert('Failed to copy template. Please copy manually.');
    });
}

// ======================
// Smooth Scrolling
// ======================
function initSmoothScroll() {
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            const href = this.getAttribute('href');
            if (href === '#' || href === '#cookie-settings-link') return;
            
            e.preventDefault();
            const target = document.querySelector(href);
            if (target) {
                target.scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
            }
        });
    });
}

// ======================
// Initialization
// ======================
function initApp() {
    try {
        setLanguage(currentLanguage);
        initLanguageSwitcher();
        initCookieBanner();
        initCopyTemplate();
        initSmoothScroll();

        const cookieConsent = getCookie('cookie_consent');
        if (cookieConsent === 'accepted') {
            loadAnalytics();
        }

        const btn = document.getElementById('lang-dropdown-btn');
        const copy = document.querySelector('.copy-template');
        console.log('[DecarsAuto] init OK', {
            hasLangButton: !!btn,
            hasCopyTemplate: !!copy,
            language: currentLanguage,
            readyState: document.readyState
        });
    } catch (err) {
        console.error('[DecarsAuto] init FAILED', err);
    }
}

if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initApp);
} else {
    initApp();
}
