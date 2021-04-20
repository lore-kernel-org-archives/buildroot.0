From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 20 Apr 2021 21:31:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-botocore: drop docutils
 dependency
In-Reply-To: <20210418200601.3474244-1-fontaine.fabrice@gmail.com>
References: <20210418200601.3474244-1-fontaine.fabrice@gmail.com>
Message-ID: <20210420193109.GC298901@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-04-18 22:06 +0200, Fabrice Fontaine spake thusly:
> docutils is not a dependency since version 1.18.0 and
> https://github.com/boto/botocore/commit/dd24dd1b2ee8654ae0cf6aebce4a2f50ea7d75f5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-botocore/Config.in | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/python-botocore/Config.in b/package/python-botocore/Config.in
> index a552900b6c..f34d774f95 100644
> --- a/package/python-botocore/Config.in
> +++ b/package/python-botocore/Config.in
> @@ -1,7 +1,6 @@
>  config BR2_PACKAGE_PYTHON_BOTOCORE
>  	bool "python-botocore"
>  	select BR2_PACKAGE_PYTHON_JMESPATH # runtime
> -	select BR2_PACKAGE_PYTHON_DOCUTILS # runtime
>  	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
>  	select BR2_PACKAGE_PYTHON_URLLIB3 # runtime
>  	help
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
