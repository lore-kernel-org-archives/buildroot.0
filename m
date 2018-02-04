From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 Feb 2018 18:08:12 +0100
Subject: [Buildroot] [PATCH 1/1] safeclib: fix trailing whitespace
In-Reply-To: <20180204163650.27265-1-fontaine.fabrice@gmail.com>
References: <20180204163650.27265-1-fontaine.fabrice@gmail.com>
Message-ID: <20180204170812.GH2411@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, all,

On 2018-02-04 17:36 +0100, Fabrice Fontaine spake thusly:
> Fixes trailing whitespace after MIT
> 
> Fixes:
>  - https://gitlab.com/buildroot.org/buildroot/-/jobs/50971692
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Thanks! ;-)

Regards,
Yann E. MORIN.

> ---
>  package/safeclib/safeclib.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/safeclib/safeclib.mk b/package/safeclib/safeclib.mk
> index 65c6621e0a..b1aa25992c 100644
> --- a/package/safeclib/safeclib.mk
> +++ b/package/safeclib/safeclib.mk
> @@ -6,7 +6,7 @@
>  
>  SAFECLIB_VERSION = v09102017
>  SAFECLIB_SITE = $(call github,rurban,safeclib,$(SAFECLIB_VERSION))
> -SAFECLIB_LICENSE = MIT 
> +SAFECLIB_LICENSE = MIT
>  SAFECLIB_LICENSE_FILES = COPYING
>  SAFECLIB_INSTALL_STAGING = YES
>  # From git
> -- 
> 2.14.1
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
