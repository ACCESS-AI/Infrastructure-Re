<#import "template.ftl" as template>
<@template.registrationLayout ; section>
    <#if section = "header">
        <span>Sign in to</span>
        <span style="color: var(--bs-purple);">My ACCESS</span>
    <#elseif section = "socialProviders" >
        <#if social.providers??>
            <#list social.providers as p>
                <#if p.alias = "switch-edu-id">
                    <button tabindex="0" class="btn btn-light btn-lg align-items-center" onclick="location.href='${p.loginUrl}';">
                        <span class="text-nowrap fs-5">Login with</span>
                        <span class="flex-grow-1 p-1">
                            <img src="${url.resourcesPath}/img/switch-edu-id.svg" alt="switch" />
                        </span>
                    </button>
                </#if>
            </#list>
            <div class="border-bottom mb-2 pt-4 position-relative">
                <span class="w-100 position-absolute top-50 h-100 start-0 text-center">
                    <text class="px-2 bg-body">or</text>
                </span>
            </div>
        </#if>
    <#elseif section = "form">
        <form class="d-flex flex-column gap-4 align-items-center" onsubmit="return true;" action="${url.loginAction}" method="post">
            <div class="w-100 text-start">
                <label for="username" class="form-label fw-bold small">Email</label>
                <div class="input-group">
                    <i class="bi bi-person input-group-text"></i>
                    <input tabindex="0" required id="username" class="form-control" name="username"
                           value="${(login.username!'')}" type="text" autoComplete="new-password">
                </div>
            </div>
            <div class="w-100 text-start">
                <label for="password" class="form-label fw-bold small">Password</label>
                <div class="input-group">
                    <i class="bi bi-key input-group-text"></i>
                    <input tabindex="0" required id="password" class="form-control" name="password" type="password" autoComplete="new-password">
                </div>
            </div>
            <div class="pt-4 text-center w-100">
                <button tabindex="0" name="login" type="submit" class="btn btn-lg btn-primary w-50">
                    Sign in
                </button>
            </div>
        </form>
    </#if>
</@template.registrationLayout>