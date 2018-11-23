From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 23 Nov 2018 14:57:12 +0100
Subject: [Buildroot] [PATCH 4/6]
 configs/olimex_a20_olinuxino_lime_legacy: use gcc 6.x and not the default
 version
In-Reply-To: <20181122094150.10403-4-thomas.petazzoni@bootlin.com>
References: <20181122094150.10403-1-thomas.petazzoni@bootlin.com>
 <20181122094150.10403-4-thomas.petazzoni@bootlin.com>
Message-ID: <df6acac2-f862-d153-155c-826132591520@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 22/11/18 10:41, Thomas Petazzoni wrote:
> The old 3.4 Linux kernel used by this defconfig doesn't build with gcc 7.x:
> 
> include/linux/compiler-gcc.h:106:1: fatal error: linux/compiler-gcc7.h: No such file or directory
> 
> So let's use gcc 6.x for the time being.
> 
> Long term, we should use a newer or different kernel source for this
> defconfig, or get rid of the defconfig entirely if there's no updated
> kernel with a fix.

Adding the author of the Lime legacy support to the recipients.

Fran?ois, if memory serves, the old kernel was needed for GPU support.
Is it still the case?

Thanks,
-- 
Luca
