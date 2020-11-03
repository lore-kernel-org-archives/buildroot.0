From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 3 Nov 2020 18:34:41 +0100
Subject: [Buildroot] [PATCH 1/1] package/mesa3d-headers: fix legal-info
In-Reply-To: <20201103171629.22280-1-fontaine.fabrice@gmail.com>
References: <20201103171629.22280-1-fontaine.fabrice@gmail.com>
Message-ID: <20201103173441.GH2887157@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-11-03 18:16 +0100, Fabrice Fontaine spake thusly:
> Commit 9d874c9051cf46ef29b763ad8db0b638f3761605 forgot to update
> MESA3D_HEADERS_LICENSE_FILES
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/d75e90863525d4abd3d83f3f947261695a2f0d65
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mesa3d-headers/mesa3d-headers.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
> index 67dc765840..afb2e799c4 100644
> --- a/package/mesa3d-headers/mesa3d-headers.mk
> +++ b/package/mesa3d-headers/mesa3d-headers.mk
> @@ -17,7 +17,7 @@ MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
>  MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
>  MESA3D_HEADERS_DL_SUBDIR = mesa3d
>  MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
> -MESA3D_HEADERS_LICENSE_FILES = docs/license.html
> +MESA3D_HEADERS_LICENSE_FILES = docs/license.rst
>  
>  # Only installs header files
>  MESA3D_HEADERS_INSTALL_STAGING = YES
> -- 
> 2.28.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
