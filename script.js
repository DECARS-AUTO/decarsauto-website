// DecarsAuto - Main JavaScript
// Language switcher, translations, cookie banner

// ======================
// Translations
// ======================
const translations = {
    en: {
        'logo-tagline': 'Specialized in VAG Online Programming & Remote Technical Support',
        'nav-services': 'Services',
        'nav-workflow': 'Workflow',
        'nav-brands': 'Brands',
        'nav-contact': 'Contact',
        'hero-title': 'DecarsAuto | Worldwide VAG Programming Solutions',
        'hero-subhead': '24/7 Remote Service - Quote after assessment - AnyDesk / TeamViewer / ToDesk / UltraViewer',
        'hero-focus': 'Focused on software programming and feature customization for VAG Group vehicles (Volkswagen / Audi / Škoda / SEAT), with strong familiarity with MQB / MLB / PQ / MEB platform architectures and control unit logic.',
        'hero-scope-title': 'Service scope:',
        'hero-scope-1': 'OEM online programming / remote flashing',
        'hero-scope-2': 'Control unit parameter coding (long coding / adaptations / security access)',
        'hero-scope-3': 'Hidden feature activation & personalization',
        'hero-scope-4': 'Module matching, initialization & factory reset',
        'hero-scope-5': 'Post-repair programming & module replacement adaptation',
        'hero-scope-6': 'SWaP / FEC feature support (depending on model & equipment)',
        'hero-tech-title': 'Technical highlights:',
        'hero-tech-1': 'Strict OEM procedures — no “force write” approach',
        'hero-tech-2': 'Experienced with SFD / SFD2 and Component Protection (CP) workflows',
        'hero-tech-3': 'Supports ODIS / VCDS / OBDeleven and related tools',
        'hero-tech-4': 'Stability, safety, and recoverability first',
        'hero-vwag-title': 'VOLKSWAGEN AG online programming projects:',
        'hero-vwag-1': 'CP (Component Protection): performed via authorized procedures',
        'hero-vwag-2': 'IMMO (Immobilizer): matching/adaptation/key-related programming (within authorization scope)',
        'hero-vwag-3': 'SVM (Software Version Management): online software and parameter management (model dependent)',
        'hero-vwag-4': 'SFD / SFD2 (Secure Feature Diagnostic): guided authorized access workflow (system dependent)',
        'hero-vwag-5': 'VKMS (VAG Key Management System): key ordering, authorization and status management (model/authorization dependent)',
        'hero-vwag-6': 'FoD (Feature on Demand): ordering, provisioning and activation (config/authorization dependent)',
        'cta-whatsapp': 'WhatsApp',
        'cta-telegram': 'Telegram',
        'link-call': 'Call',
        'link-template': 'Copy request template',
        'brands-title': 'Supported Brands',
        'services-title': 'Core Services',
        'service1-title': 'OEM online programming / remote flashing',
        'service1-desc': 'OEM online programming and remote flashing, depending on vehicle & region',
        'service2-title': 'Control unit parameter coding (long coding / adaptations / security access)',
        'service2-desc': 'Coding, adaptations, and security access following OEM procedures',
        'service3-title': 'Hidden feature activation & personalization',
        'service3-desc': 'Feature activation and personalization depending on equipment',
        'service4-title': 'Module matching, initialization & factory reset',
        'service4-desc': 'Matching, initialization, and restoring factory settings',
        'service5-title': 'Post-repair programming & module replacement adaptation',
        'service5-desc': 'Programming after repairs and adaptation after module replacement',
        'service6-title': 'SWaP / FEC feature support',
        'service6-desc': 'Feature support depending on model and equipment',
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
        'logo-tagline': 'Spezialisiert auf VAG Online-Programmierung & Remote-Technische Unterstützung',
        'nav-services': 'Leistungen',
        'nav-workflow': 'Ablauf',
        'nav-brands': 'Marken',
        'nav-contact': 'Kontakt',
        'hero-title': 'DecarsAuto | Weltweite VAG-Programmierlösungen',
        'hero-subhead': '24/7 Remote-Service - Angebot nach Bewertung - AnyDesk / TeamViewer / ToDesk / UltraViewer',
        'hero-focus': 'Fokus auf Software-Programmierung und Funktionsanpassung für Fahrzeuge der VAG-Gruppe (Volkswagen / Audi / Škoda / SEAT) – mit fundierter Erfahrung in MQB / MLB / PQ / MEB Plattformarchitekturen und Steuergeräte-Logik.',
        'hero-scope-title': 'Leistungsumfang:',
        'hero-scope-1': 'OEM Online-Programmierung / Remote-Flash',
        'hero-scope-2': 'Steuergerät-Parametercodierung (Long Coding / Anpassung / Security Access)',
        'hero-scope-3': 'Freischaltung versteckter Funktionen & individuelle Personalisierung',
        'hero-scope-4': 'Modul-Abgleich, Initialisierung & Werksreset',
        'hero-scope-5': 'Programmierung nach Reparatur, Anpassung bei Modulwechsel',
        'hero-scope-6': 'SWaP / FEC Unterstützung (abhängig von Modell & Ausstattung)',
        'hero-tech-title': 'Technische Merkmale:',
        'hero-tech-1': 'Strikt nach OEM-Logik – keine aggressive/gewaltsame Schreibmethode',
        'hero-tech-2': 'Vertraut mit SFD / SFD2 sowie Component Protection (CP) Prozessen',
        'hero-tech-3': 'Unterstützt ODIS / VCDS / OBDeleven und weitere Tools',
        'hero-tech-4': 'Stabilität, Sicherheit und Wiederherstellbarkeit stehen an erster Stelle',
        'hero-vwag-title': 'VOLKSWAGEN AG Online-Programmierungsprojekte:',
        'hero-vwag-1': 'CP (Component Protection / Komponenten-Schutz): Durchführung gemäß autorisiertem Prozess',
        'hero-vwag-2': 'IMMO (Wegfahrsperre): Matching/Anpassung/Schlüssel-bezogene Programmierung (im Autorisierungsrahmen)',
        'hero-vwag-3': 'SVM (Software Version Management): Online-Software- und Parameterverwaltung (modellabhängig)',
        'hero-vwag-4': 'SFD / SFD2 (Secure Feature Diagnostic): geführter autorisierter Zugriff (systemabhängig)',
        'hero-vwag-5': 'VKMS (VAG Key Management System): Schlüsselbestellung, Autorisierung und Statusverwaltung (modell- und berechtigungsabhängig)',
        'hero-vwag-6': 'FoD (Feature on Demand): Funktionsbestellung, Bereitstellung und Aktivierung (konfigurations- und berechtigungsabhängig)',
        'cta-whatsapp': 'WhatsApp',
        'cta-telegram': 'Telegram',
        'link-call': 'Anrufen',
        'link-template': 'Anfragevorlage kopieren',
        'brands-title': 'Supported Brands',
        'services-title': 'Kernleistungen',
        'service1-title': 'OEM Online-Programmierung / Remote-Flash',
        'service1-desc': 'Originale Online-Programmierung und Remote-Flash je nach Fahrzeug & Region',
        'service2-title': 'Parameter-Codierung (Long Coding / Anpassung / Security Access)',
        'service2-desc': 'Codierung, Anpassungen und Security Access nach OEM-Logik',
        'service3-title': 'Versteckte Funktionen & Personalisierung',
        'service3-desc': 'Freischaltung und individuelle Anpassungen je nach Ausstattung',
        'service4-title': 'Modul-Matching / Initialisierung / Werksreset',
        'service4-desc': 'Abgleich, Initialisierung und Wiederherstellung auf Werkseinstellungen',
        'service5-title': 'Programmierung nach Reparatur & Modulwechsel',
        'service5-desc': 'Anpassung nach Reparaturen und bei Steuergeräte-/Modultausch',
        'service6-title': 'SWaP / FEC Unterstützung',
        'service6-desc': 'Funktionsunterstützung abhängig von Modell und Ausstattung',
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
        'logo-tagline': '专注于大众汽车集团在线编程与远程技术支持',
        'nav-services': 'Services',
        'nav-workflow': 'Workflow',
        'nav-brands': 'Brands',
        'nav-contact': 'Contact',
        'hero-title': 'DecarsAuto | 为全球客户提供大众汽车集团编程解决方案',
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
// Language Management with Auto-Detection
// ======================
let currentLanguage = localStorage.getItem('language') || null;
let languagePreference = localStorage.getItem('languagePreference') || 'auto'; // 'auto' or 'manual'

// Detect browser language
function detectBrowserLanguage() {
    const browserLang = (navigator.language || navigator.userLanguage).toLowerCase();

    // Map browser language to supported languages
    if (browserLang.startsWith('zh')) {
        return 'zh';
    } else if (browserLang.startsWith('de')) {
        return 'de';
    } else {
        return 'en'; // Default to English
    }
}

// Get effective language (auto or manual)
function getEffectiveLanguage() {
    const preference = localStorage.getItem('languagePreference') || 'auto';

    if (preference === 'auto') {
        return detectBrowserLanguage();
    } else {
        return localStorage.getItem('language') || detectBrowserLanguage();
    }
}

// Initialize current language
if (!currentLanguage || languagePreference === 'auto') {
    currentLanguage = getEffectiveLanguage();
}

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
// Language Switcher with Auto/Manual Mode
// ======================
function initLanguageSwitcher() {
    const dropdownBtn = document.getElementById('lang-dropdown-btn');
    const dropdownMenu = document.getElementById('lang-dropdown-menu');
    const langOptions = document.querySelectorAll('.lang-option');

    if (!dropdownBtn || !dropdownMenu) return;

    // Apply initial language
    setLanguage(getEffectiveLanguage());

    // Toggle dropdown
    dropdownBtn.addEventListener('click', (e) => {
        e.stopPropagation();
        const isOpen = dropdownMenu.classList.toggle('show');
        dropdownBtn.classList.toggle('active', isOpen);
    });

    // Language selection (switches to manual mode)
    langOptions.forEach(option => {
        option.addEventListener('click', (e) => {
            e.stopPropagation();
            const lang = option.getAttribute('data-lang');

            // Switch to manual mode when user clicks
            localStorage.setItem('languagePreference', 'manual');
            setLanguage(lang);

            dropdownMenu.classList.remove('show');
            dropdownBtn.classList.remove('active');
        });
    });

    // Long press to switch back to auto mode (hold for 1 second)
    let pressTimer;

    dropdownBtn.addEventListener('mousedown', () => {
        pressTimer = setTimeout(() => {
            // Switch to auto mode
            localStorage.setItem('languagePreference', 'auto');
            const autoLang = detectBrowserLanguage();
            setLanguage(autoLang);

            // Show notification
            showLanguageNotification(`Auto mode enabled - Following browser language (${autoLang.toUpperCase()})`);
        }, 1000);
    });

    dropdownBtn.addEventListener('mouseup', () => {
        clearTimeout(pressTimer);
    });

    dropdownBtn.addEventListener('mouseleave', () => {
        clearTimeout(pressTimer);
    });

    // Mobile touch events
    dropdownBtn.addEventListener('touchstart', () => {
        pressTimer = setTimeout(() => {
            localStorage.setItem('languagePreference', 'auto');
            const autoLang = detectBrowserLanguage();
            setLanguage(autoLang);
            showLanguageNotification(`Auto mode enabled - Following browser language (${autoLang.toUpperCase()})`);
        }, 1000);
    });

    dropdownBtn.addEventListener('touchend', () => {
        clearTimeout(pressTimer);
    });

    // Close dropdown when clicking outside
    document.addEventListener('click', (e) => {
        if (!dropdownMenu.contains(e.target) && !dropdownBtn.contains(e.target)) {
            dropdownMenu.classList.remove('show');
            dropdownBtn.classList.remove('active');
        }
    });
}

// Helper function to show language notifications
function showLanguageNotification(message) {
    // Check if notification element exists
    let notification = document.getElementById('language-notification');

    if (!notification) {
        // Create notification element
        notification = document.createElement('div');
        notification.id = 'language-notification';
        notification.className = 'language-notification';
        document.body.appendChild(notification);
    }

    // Set message and show
    notification.textContent = message;
    notification.classList.add('show');

    // Hide after 3 seconds
    setTimeout(() => {
        notification.classList.remove('show');
    }, 3000);
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
