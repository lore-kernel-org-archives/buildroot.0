From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 3 Apr 2015 13:44:32 +0300
Subject: [Buildroot] [PATCH] toolchains: remove non-LFS toolchain
In-Reply-To: <1428057549-24019-1-git-send-email-yann.morin.1998@free.fr>
References: <1428057549-24019-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150403104432.GN17056@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Fri, Apr 03, 2015 at 12:39:09PM +0200, Yann E. MORIN wrote:
> Buildroot now requires toolchains to have LFS; it's no longer optional.

Why not just rebuild this toolchain using current master with LFS?

baruch

> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  web/toolchains/configs/br-powerpc-603e-basic-cpp.config | 9 ---------
>  1 file changed, 9 deletions(-)
>  delete mode 100644 web/toolchains/configs/br-powerpc-603e-basic-cpp.config
> 
> diff --git a/web/toolchains/configs/br-powerpc-603e-basic-cpp.config b/web/toolchains/configs/br-powerpc-603e-basic-cpp.config
> deleted file mode 100644
> index 9f1eb82..0000000
> --- a/web/toolchains/configs/br-powerpc-603e-basic-cpp.config
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -BR2_powerpc=y
> -BR2_powerpc_603e=y
> -BR2_TOOLCHAIN_EXTERNAL=y
> -BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> -BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> -BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-powerpc-603e-basic-cpp-2015.02.tar.bz2"
> -BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_18=y
> -# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
> -BR2_TOOLCHAIN_EXTERNAL_CXX=y

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
