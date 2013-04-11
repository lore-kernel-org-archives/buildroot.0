From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Date: Thu, 11 Apr 2013 09:41:08 -0700
Subject: [Buildroot] [PATCH] fs: add uimage support w/ example for cpio
In-Reply-To: <1365691684-30663-2-git-send-email-spenser@gillilanding.com>
References: <1365691684-30663-1-git-send-email-spenser@gillilanding.com>
 <1365691684-30663-2-git-send-email-spenser@gillilanding.com>
Message-ID: <49d6e462-47fd-4a31-b59f-8e509747b9bf@VA3EHSMHS012.ehs.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Apr 11, 2013 at 09:48:04AM -0500, Spenser Gilliland wrote:
> From: Spenser Gilliland <Spenser309@gmail.com>
> 
> Adds uimage support for various root filesystems.  Uimage support is needed
> when using the bootm command in uboot.  This provides both a simple infrastructure
> similar to the current BR2_TARGET_ROOTFS_$(2)_GZ for adding compression. To define the a rootfs should have a UIMAGE wrapper simply create the BR2_TARGET_ROOTFS_$(2)_UIMAGE symbol.
> 
> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Tested-by: Soren Brinkmann <soren.brinkmann@xilinx.com>

I successfully created a lzma compressed initramfs with u-boot header.
With this and my patch from yesterday I can directly create working root file
systems for Zynq w/o any further interaction.

This patch though, adds two lines with trailing white spaces.

	S?ren
