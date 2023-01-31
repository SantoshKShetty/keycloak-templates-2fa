<#--  This change shall be copied to `two-factor-authentication.ftl`  -->
<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true displayMessage=false; section>
    <#if section="form">
        <div id="kc-form">
            <div id="kc-form-wrapper">
                <div id="kc-2fa-desc" class="${properties.kcFormGroupClass!}">
                    ${kcSanitize(msg("2faOtpDesc", "joe.doe@synacor.com"))?no_esc}
                </div>

                <form id="two-factor-authentication-form" action="${url.loginAction}" method="post">
                    <div class="${properties.kcFormGroupClass!}">
                        <input
                            type="text"
                            name="otp"
                            class="${properties.kcInputClass!}"
                            placeholder="${msg("2faOtpField")}"
                        />
                    </div>

                    <div id="kc-form-buttons">
                        <div class="${properties.kcFormGroupClass!}">
                            <input tabindex="4" type="submit" value="${msg("verifyOtpBtn")}"
                                class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}"
                            />
                        </div>
                    </div>
                </form>

                <div id="kc-form-buttons">
                    <div class="${properties.kcFormGroupClass!}">
                        <a tabindex="4" href="${url.loginRestartFlowUrl}"
                            class="${properties.kcButtonClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}">
                            ${msg("doBack")}
                        </a>
                    </div>
                </div>
            </div>
        </div>
    <#elseif section="info">
        <div class="${properties.kcFormGroupClass!}">
            <div id="kc-form-options">
                <div class="${properties.kcFormOptionsWrapperClass!}">
                    <p><a tabindex="6" href="javascript:void(0);">${msg("2faSendNewOtp")}</a></p>
                </div>
            </div>
        </div>
    </#if>
</@layout.registrationLayout>