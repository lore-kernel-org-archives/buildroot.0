From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Jan 2021 12:02:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/rng-tools: bump to version 6.11
In-Reply-To: <20210110103830.789917-1-fontaine.fabrice@gmail.com>
References: <20210110103830.789917-1-fontaine.fabrice@gmail.com>
Message-ID: <20210110110250.GO3044608@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-01-10 11:38 +0100, Fabrice Fontaine spake thusly:
> Drop patches (already in version)
> 
> https://github.com/nhorman/rng-tools/releases/tag/V6.11
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
[--SNIP--]
> diff --git a/package/rng-tools/rng-tools.mk b/package/rng-tools/rng-tools.mk
> index 888b4e323e..ae20d96362 100644
> --- a/package/rng-tools/rng-tools.mk
> +++ b/package/rng-tools/rng-tools.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  RNG_TOOLS_VERSION = 6.11

Uh? Did you forget to squash your pathes together before sending?

Regards,
Yann E. MORIN.

> -RNG_TOOLS_SITE = $(call github,nhorman,$(RNG_TOOLS_NAME),v$(RNG_TOOLS_VERSION))
> +RNG_TOOLS_SITE = $(call github,nhorman,$(RNG_TOOLS_NAME),V$(RNG_TOOLS_VERSION))
>  RNG_TOOLS_LICENSE = GPL-2.0
>  RNG_TOOLS_LICENSE_FILES = COPYING
>  RNG_TOOLS_DEPENDENCIES = libsysfs host-pkgconf openssl
> -- 
> 2.29.2
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
