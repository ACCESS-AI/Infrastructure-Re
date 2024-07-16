<#macro registrationLayout displayInfo=false displayMessage=true displayRequiredFields=false>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="robots" content="noindex, nofollow">
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>ACCESS</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Courier+Prime&family=DM+Sans:wght@400;700&family=Manrope:wght@400;600&display=swap">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
        <link rel="icon" href="${url.resourcesPath}/img/favicon.ico" />
        <link rel="stylesheet" href="${url.resourcesPath}/css/styles.css" />
    </head>
    <body class="d-flex flex-column align-items-center">
    <div class="w-100 d-flex h-auto align-items-center">
        <span class="font-monospace logo">ACCESS.</span>
    </div>
    <div class="w-auto d-flex flex-column gap-4 p-5 mt-5 text-center position-relative shadow-lg rounded-5 bg-body">
        <div class="d-flex gap-2 fs-3 fw-bold text-capitalize">
            <#nested "header">
        </div>
        <#nested "socialProviders">
        <#nested "form">
        <#if message?has_content>
            <div class="position-absolute top-100 start-0 mt-5 alert alert-<#if message.type = 'error'>danger<#else>${message.type}</#if>" role="alert">
                <span>${kcSanitize(message.summary)?no_esc}</span>
            </div>
        </#if>
    </div>
    </body>
    </html>
</#macro>