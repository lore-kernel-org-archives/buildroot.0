From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Apr 2014 21:54:11 +0200
Subject: [Buildroot] [PATCH] kexec: bump to version 2.0.6
In-Reply-To: <1397718918-6590-1-git-send-email-neumann@teufel.de>
References: <1397718918-6590-1-git-send-email-neumann@teufel.de>
Message-ID: <20140417215411.13d116c3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sven Neumann,

On Thu, 17 Apr 2014 09:15:18 +0200, Sven Neumann wrote:
> Remove two patches which have been included upstream.
> 
> Signed-off-by: Sven Neumann <neumann@teufel.de>
> ---
>  ...ix-build-failure-bzImage_support_efi_boot.patch | 28 ---------------
>  ...e-probe-function-return-value-checking-fi.patch | 41 ----------------------
>  package/kexec/kexec.mk                             |  2 +-
>  3 files changed, 1 insertion(+), 70 deletions(-)
>  delete mode 100644 package/kexec/kexec-0002-i386-fix-build-failure-bzImage_support_efi_boot.patch
>  delete mode 100644 package/kexec/kexec-0003-kernel-image-probe-function-return-value-checking-fi.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
