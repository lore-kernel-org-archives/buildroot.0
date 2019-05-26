From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 26 May 2019 20:55:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/mender: bump to version 2.0.0
In-Reply-To: <20190508154924.67828-1-aduskett@gmail.com>
References: <20190508154924.67828-1-aduskett@gmail.com>
Message-ID: <20190526205510.04cc44ea@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adam,

On Wed,  8 May 2019 11:49:24 -0400
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> In addition:
>   - Update hashes for license files.

As we have already explain a zillion times already, when the license
hashes are changed, there *must* be an explanation in the commit log
about what changed in the license file(s).

> diff --git a/package/mender/Config.in b/package/mender/Config.in
> index 5ab2304e49..e8c29bb33e 100644
> --- a/package/mender/Config.in
> +++ b/package/mender/Config.in
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_MENDER
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_PACKAGE_XZ # LZMA

The "LZMA" comment is not necessary, we typically don't have such
comments.

Could you resend with an updated commit log that explains the license
file changes ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
