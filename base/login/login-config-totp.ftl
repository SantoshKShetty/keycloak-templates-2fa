<#--  This change shall be copied to `two-factor-registration.ftl`  -->
<#import "template.ftl" as layout>
<@layout.registrationLayout displayRequiredFields=false displayInfo=true displayMessage=false; section>
    <#if section = "header">
        ${msg("login2FASetupTitle")}
    <#elseif section = "form">
        <div id="kc-form">
            <div id="kc-form-wrapper">
                <div id="kc-2fa-desc" class="${properties.kcFormGroupClass!}">
                    ${kcSanitize(msg("login2FASetupDesc"))?no_esc}
                </div>

                <div class="${properties.kcFormGroupClass!}">
                    <input
                        type="text"
                        id="2fa-email-or-sms-field"
                        class="${properties.kcInputClass!}"
                        tabindex="1"
                        autofocus
                        autocomplete="off"
                        placeholder="${msg("2faEmailOrSmsField")}"
                    />
                </div>

                <script>
                    const isEmail = val => /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(val)

                    const isPhone = val => /^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$/gmi.test(val)

                    const handle2FAFormSubmission = event => {
                        if (event && event.keyCode === 13) {
                            // Enter key pressed.
                            document.getElementById('two-factor-registration-form').submit();
                        }
                    };

                    const handleEmailOrPasswordInput = event => {
                        const val = event.target.value;
                        const emailField = document.getElementById('email');
                        const phoneField = document.getElementById('phone');
                        const prefMethodField = document.getElementById('prefMethod');

                        if (isEmail(val)) {
                            emailField.setAttribute('value', val);
                            phoneField.removeAttribute('value');
                            prefMethodField.setAttribute('value', 'email');
                        } else if (isPhone(val)) {
                            phoneField.setAttribute('value', val);
                            emailField.removeAttribute('value');
                            prefMethodField.setAttribute('value', 'sms');
                        } else {
                            emailField.removeAttribute('value');
                            phoneField.removeAttribute('value');
                            prefMethodField.removeAttribute('value');
                        }
                    };

                    document.addEventListener('DOMContentLoaded', () => {
                        const EmailOrSmsField = document.getElementById('2fa-email-or-sms-field');

                        if (EmailOrSmsField) {
                            EmailOrSmsField.addEventListener('input', handleEmailOrPasswordInput, false);
                            EmailOrSmsField.addEventListener('keyup', handle2FAFormSubmission, false);
                        }
                    }, false);
                </script>

                <form id="two-factor-registration-form" action="${url.loginAction}" method="post">
                    <input type="hidden" id="email" name="email" />
                    <input type="hidden" id="phone" name="sms" />
                    <input type="hidden" id="prefMethod" name="prefered_method" />
                    <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}">
                        <input type="submit" value="${msg("sendOtpBtn")}"
                            class="${properties.kcButtonClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!} ${properties.kcButtonPrimaryClass!}"
                        />
                    </div>
                </form>
            </div>
        </div>
    <#elseif section = "info">
        <div class="${properties.kcFormGroupClass!}">
            <div id="kc-form-options">
                <div class="${properties.kcFormOptionsWrapperClass!}">
                    <p>
                        <a tabindex="6" href="javascript:void(0);">${msg("skip2FASetup")}</a>
                    </p>
                    <p>
                        <a tabindex="6" href="javascript:void(0);">${msg("decline2FASetup")}</a>
                    </p>
                </div>
            </div>
        </div>
    </#if>
</@layout.registrationLayout>