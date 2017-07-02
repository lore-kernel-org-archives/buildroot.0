From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Jul 2017 15:43:32 +0200
Subject: [Buildroot] [PATCH 1/4] support/testing: add tests for musl and
 uclibc toolchains
In-Reply-To: <20170702134107.11488-2-thomas.petazzoni@free-electrons.com>
References: <20170702134107.11488-1-thomas.petazzoni@free-electrons.com>
 <20170702134107.11488-2-thomas.petazzoni@free-electrons.com>
Message-ID: <20170702154332.6247d720@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  2 Jul 2017 15:41:04 +0200, Thomas Petazzoni wrote:

> +BR2_arm=y
> +BR2_cortex_a9=y
> +BR2_ARM_ENABLE_VFP=y
> +BR2_TOOLCHAIN_EXTERNAL=y
> +BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> +BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> +BR2_TOOLCHAIN_EXTERNAL_URL="http://prout.org/arm-ctng-linux-musleabihf.tar.xz"

OK, this should have been
http://autobuild.buildroot.net/toolchains/tarballs/arm-ctng-linux-musleabihf.tar.xz.
Will fix for v2.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
