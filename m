From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 1 Nov 2011 13:44:12 +0200
Subject: [Buildroot] [PATCH] toolchain/ct-ng: update to 1.13.0
In-Reply-To: <1320145111-5171-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1320145111-5171-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <20111101114412.GA26415@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Tue, Nov 01, 2011 at 11:58:31AM +0100, Yann E. MORIN wrote:
> Update the version in the package description. Update the default
> configuration files for the three different C libraries.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
> ---

[snip]

> @@ -25,10 +22,10 @@ CT_MODULES=y
>  #
>  # Paths
>  #
> -CT_LOCAL_TARBALLS_DIR=""
> +CT_LOCAL_TARBALLS_DIR="/home/ymorin/dev/buildroot/br.wip/dl"

Is this intentional?

>  CT_SAVE_TARBALLS=y
>  CT_WORK_DIR="${CT_TOP_DIR}/.build"
> -CT_PREFIX_DIR="${HOME}/x-tools/${CT_TARGET}"
> +CT_PREFIX_DIR="/home/ymorin/dev/buildroot/O/host/usr"

And this.

[snip]

> @@ -128,8 +139,8 @@ CT_FORCE_SYSROOT=y
>  CT_USE_SYSROOT=y
>  CT_SYSROOT_NAME="sysroot"
>  CT_SYSROOT_DIR_PREFIX=""
> -CT_STATIC_TOOLCHAIN_POSSIBLE=y
> -CT_TOOLCHAIN_PKGVERSION=""
> +CT_WANTS_STATIC_LINK=y
> +CT_TOOLCHAIN_PKGVERSION="buildroot 2011.11-git-00322-g9b25853-dirty"

Ditto.

>  CT_TOOLCHAIN_BUGURL=""
>  
>  #
> @@ -137,7 +148,7 @@ CT_TOOLCHAIN_BUGURL=""
>  #
>  CT_TARGET_VENDOR="unknown"
>  CT_TARGET_ALIAS_SED_EXPR=""
> -CT_TARGET_ALIAS=""
> +CT_TARGET_ALIAS="armeb-linux"

Ditto.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
