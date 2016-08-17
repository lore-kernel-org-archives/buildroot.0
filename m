From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Aug 2016 23:06:52 +0200
Subject: [Buildroot] [PATCH] uclibc: ARC: Support syscall ABI v4
In-Reply-To: <1471450774-8666-1-git-send-email-vzakhar@synopsys.com>
References: <1471450774-8666-1-git-send-email-vzakhar@synopsys.com>
Message-ID: <20160817230652.13511e0f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 17 Aug 2016 19:19:34 +0300, Vlad Zakharov wrote:

> diff --git a/package/uclibc/0003-uclibc-ng-devel-uClibc-ARC-Support-syscall-ABI-v4.patch b/package/uclibc/0003-uclibc-ng-devel-uClibc-ARC-Support-syscall-ABI-v4.patch
> new file mode 100644
> index 0000000..14e24d0
> --- /dev/null
> +++ b/package/uclibc/0003-uclibc-ng-devel-uClibc-ARC-Support-syscall-ABI-v4.patch
> @@ -0,0 +1,21 @@
> +diff --git a/libc/sysdeps/linux/arc/bits/uClibc_arch_features.h b/libc/sysdeps/linux/arc/bits/uClibc_arch_features.h
> +index 51607240cd82..94e089d5dfa8 100755
> +--- a/libc/sysdeps/linux/arc/bits/uClibc_arch_features.h
> ++++ b/libc/sysdeps/linux/arc/bits/uClibc_arch_features.h

All patches must have a description + Signed-off-by.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
