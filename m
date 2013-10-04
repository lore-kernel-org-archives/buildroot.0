From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 04 Oct 2013 15:05:35 +0200
Subject: [Buildroot] [PATCH] configs/qemu: bump relevant config versions
In-Reply-To: <1380890978-13158-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 4 Oct 2013 09:49:38 -0300")
References: <1380890978-13158-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <874n8xkwyo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> arm_nuri needs some DT fixups to switch to the 3.11.x series
 Gustavo> since it's now default for that kernel defconfig.

 Gustavo> +++ b/configs/qemu_sparc_ss10_defconfig
 Gustavo> @@ -8,11 +8,11 @@ BR2_TARGET_ROOTFS_EXT2=y
 
 Gustavo>  # Lock to 3.7 headers to avoid breaking with newer kernels
 Gustavo>  BR2_KERNEL_HEADERS_VERSION=y
 Gustavo> -BR2_DEFAULT_KERNEL_VERSION="3.7.10"
 Gustavo> +BR2_DEFAULT_KERNEL_VERSION="3.11.3"

Committed with the comment updated, thanks.

-- 
Bye, Peter Korsgaard
