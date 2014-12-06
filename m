From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 Dec 2014 11:55:55 +0100
Subject: [Buildroot] [PATCH 1/3] fconfig: change upstream site
In-Reply-To: <1417859787-31970-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417859787-31970-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141206105555.GA3938@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-12-06 10:56 +0100, Thomas Petazzoni spake thusly:
> The upstream site is dead, used http://sources.buildroot.net
> temporarly.
> 
> Fixes:
> 
>   http://autobuild.buildroot.org/results/778/77899f882e04121ca5f2b96f0df9f24ead26d12b/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

I've had a look at what others do, and OpenWRT still has no better URL.

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/fconfig/fconfig.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/fconfig/fconfig.mk b/package/fconfig/fconfig.mk
> index 3a846f4..7f7faad 100644
> --- a/package/fconfig/fconfig.mk
> +++ b/package/fconfig/fconfig.mk
> @@ -5,7 +5,9 @@
>  ################################################################################
>  
>  FCONFIG_VERSION = 20080329
> -FCONFIG_SITE = http://andrzejekiert.ovh.org/software/fconfig
> +# Real upstream location has been disabled
> +# FCONFIG_SITE = http://andrzejekiert.ovh.org/software/fconfig
> +FCONFIG_SITE = http://sources.buildroot.net
>  FCONFIG_LICENSE = GPLv2+
>  FCONFIG_LICENSE_FILES = fconfig.c
>  
> -- 
> 2.1.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
