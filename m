From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jun 2016 22:00:00 +0200
Subject: [Buildroot] [PATCH v1] wiringpi: fix musl compile
In-Reply-To: <1465499125-28312-1-git-send-email-ps.report@gmx.net>
References: <1465499125-28312-1-git-send-email-ps.report@gmx.net>
Message-ID: <20160609220000.27215c1d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  9 Jun 2016 21:05:25 +0200, Peter Seiderer wrote:
> Fixes [1]:
> 
>   wiringPiSPI.c:89:35: error: '_IOC_SIZEBITS' undeclared (first use in this function)
> 
> Patch from yocto meta-raspberrypi [2] adding include of asm/ioctl.h.
> 
> [1] http://autobuild.buildroot.net/results/e9d/e9d680af7eea6d6c68c8e48248b5cc5b29389baa
> [2] https://github.com/agherzan/meta-raspberrypi/blob/master/recipes-devtools/wiringPi/wiringpi/0001-include-asm-ioctl.h-directly-for-_IOC_SIZEBITS.patch
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...de-asm-ioctl.h-directly-for-_IOC_SIZEBITS.patch | 60 ++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 package/wiringpi/0002-include-asm-ioctl.h-directly-for-_IOC_SIZEBITS.patch

Applied to master, thanks. Please submit the patch upstream as well,
thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
