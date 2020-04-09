From: =?UTF-8?Q?S=c3=a9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Thu, 9 Apr 2020 11:16:46 +0200
Subject: [Buildroot] [PATCH v1 1/5] package/python-flask: remove
 erroneously python-lxml dependency
In-Reply-To: <20200408204828.998-1-ps.report@gmx.net>
References: <20200408204828.998-1-ps.report@gmx.net>
Message-ID: <3f1da423-9d47-da59-861a-11bc98510fdc@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 4/8/20 10:48 PM, Peter Seiderer wrote:
> Remove erroneously python-lxml dependency (as noted by
> Peter Korsgaard).
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Reviewed-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>

Regards,

> ---
>  package/python-flask/Config.in | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/python-flask/Config.in b/package/python-flask/Config.in
> index 72fcb61999..556afab6d2 100644
> --- a/package/python-flask/Config.in
> +++ b/package/python-flask/Config.in
> @@ -2,7 +2,6 @@ config BR2_PACKAGE_PYTHON_FLASK
>  	bool "python-flask"
>  	select BR2_PACKAGE_PYTHON_CLICK # runtime
>  	select BR2_PACKAGE_PYTHON_JINJA2 # runtime
> -	select BR2_PACKAGE_PYTHON_LXML # runtime
>  	select BR2_PACKAGE_PYTHON_WERKZEUG # runtime
>  	select BR2_PACKAGE_PYTHON_ITSDANGEROUS # runtime
>  	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
> 


-- 
S?bastien Szymanski, Armadeus Systems
Software engineer
