From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Mar 2018 08:21:52 +0200
Subject: [Buildroot] [PATCH 14/36] toolchain/toolchain.mk: fix code style
In-Reply-To: <20180331022301.27501-15-ricardo.martincoski@gmail.com>
References: <20180331022301.27501-1-ricardo.martincoski@gmail.com>
 <20180331022301.27501-15-ricardo.martincoski@gmail.com>
Message-ID: <20180331082152.62797621@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 30 Mar 2018 23:22:39 -0300, Ricardo Martincoski wrote:

>  # Install the gconv modules
>  ifeq ($(BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY),y)
> -GCONV_LIBS = $(call qstrip,$(BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_LIST))
> +TOOLCHAIN_GLIBC_GCONV_LIBS = $(call qstrip,$(BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_LIST))
>  define COPY_GCONV_LIBS

Perhaps the name of this variable should also be name-spaced:
TOOLCHAIN_GLIBC_COPY_GCONV_LIBS or something like that.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
