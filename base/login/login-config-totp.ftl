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

                <form id="two-factor-registration-form" action="${url.loginAction}" method="post">
                    <input type="hidden" id="email" name="email" />
                    <input type="hidden" id="sms" name="sms" />
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