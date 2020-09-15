From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Tue, 15 Sep 2020 23:37:40 +0200
Subject: [Buildroot] [PATCH 3/3] package/python-sentry-sdk: update
 homepage URL
In-Reply-To: <20200908192336.155428-3-joseph.kogut@gmail.com>
References: <20200908192336.155428-1-joseph.kogut@gmail.com>
 <20200908192336.155428-3-joseph.kogut@gmail.com>
Message-ID: <628c32a5-8a6d-1cd0-ab73-5d278d15e235@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On 8/09/20 21:23, Joseph Kogut wrote:
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>

Reviewed-by: Titouan Christophe <titouan.christophe@railnova.eu>

> ---
>   package/python-sentry-sdk/Config.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/python-sentry-sdk/Config.in b/package/python-sentry-sdk/Config.in
> index 62b8100bdb..e8e88bac18 100644
> --- a/package/python-sentry-sdk/Config.in
> +++ b/package/python-sentry-sdk/Config.in
> @@ -3,6 +3,6 @@ config BR2_PACKAGE_PYTHON_SENTRY_SDK
>   	select BR2_PACKAGE_PYTHON_CERTIFI # runtime
>   	select BR2_PACKAGE_PYTHON_URLLIB3 # runtime
>   	help
> -	  Python client for Sentry (https://getsentry.com).
> +	  Python client for Sentry (https://sentry.io).
>   
>   	  https://github.com/getsentry/sentry-python
> 

Titouan
