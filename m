From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Jul 2013 14:38:44 +0200
Subject: [Buildroot] [PATCH] u-boot: support custom u-boot.bin name
In-Reply-To: <b03d9402321cbcb3ae1e.1374659414@BEANTN0L019720>
References: <b03d9402321cbcb3ae1e.1374659414@BEANTN0L019720>
Message-ID: <20130727143844.14d20a5e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Wed, 24 Jul 2013 11:50:14 +0200, Thomas De Schampheleire wrote:
> On some platforms, the standard U-Boot binary is not called u-boot.bin,
> but u-boot<something>.bin. This is for example the case on the
> Cavium-provided u-boot, where the output file is called
> u-boot_<boardname>.bin.
> 
> This patch adds a 'custom format' choice in the existing u-boot binary
> format selection, where this name can be put. In the Cavium example, this
> option could be set to:
> BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-$(BR2_TARGET_UBOOT_BOARDNAME).bin"
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Committed, thanks.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
