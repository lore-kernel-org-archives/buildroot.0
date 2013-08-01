From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Aug 2013 18:09:36 +0200
Subject: [Buildroot] [PATCH] dtb: provide option to install dtb to boot
 directory
In-Reply-To: <1356042147-1532-1-git-send-email-bear@bears.org>
References: <1356042147-1532-1-git-send-email-bear@bears.org>
Message-ID: <20130801180936.46032aa0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gary Coulbourne,

On Thu, 20 Dec 2012 17:22:27 -0500, Gary Coulbourne wrote:
> 
> Signed-off-by: Gary Coulbourne <bear@bears.org>
> ---
>  linux/Config.in |    6 ++++++
>  linux/linux.mk  |    7 +++++++
>  2 files changed, 13 insertions(+)

This patch is in fact not needed, because the existing
BR2_LINUX_KERNEL_INSTALL_TARGET option installs both the kernel image
and the DTBs to /boot. I've updated the BR2_LINUX_KERNEL_INSTALL_TARGET
help text to clarify this.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
