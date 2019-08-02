From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 2 Aug 2019 23:26:01 +0200
Subject: [Buildroot] csky_gx6605s_defconfig add
 "BR2_TOOLCHAIN_EXTERNAL=y"
In-Reply-To: <tencent_2664A2093675DB6268415CDB@qq.com>
References: <tencent_2664A2093675DB6268415CDB@qq.com>
Message-ID: <8130d244-31a8-a5df-9bc9-ecb2d53280c9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Liu,

 Thank you for this patch.

On 20/06/2019 11:56, ??? wrote:
> hi?
> ???????? ? buildroot source: git clone git://git.buildroot.net/buildroot
> ?????????
> all BR2_TOOLCHAIN_EXTERNAL_* items depend on BR2_TOOLCHAIN_EXTERNAL=y


> 
> diff --git a/configs/csky_gx6605s_defconfig b/configs/csky_gx6605s_defconfig
> index d0a2aad..22e9e0c 100644
> --- a/configs/csky_gx6605s_defconfig
> +++ b/configs/csky_gx6605s_defconfig
> @@ -1,5 +1,6 @@
> ?BR2_csky=y
> ?BR2_GLOBAL_PATCH_DIR="board/csky/gx6605s/patches"
> +BR2_TOOLCHAIN_EXTERNAL=y
> ?BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> ?BR2_TOOLCHAIN_EXTERNAL_URL="https://github.com/c-sky/tools/raw/master/csky-linux-tools-x86_64-glibc-linux-4.9.56-20180128.tar.gz"
> ?BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="csky-linux"
> 
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
