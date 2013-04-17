From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Date: Wed, 17 Apr 2013 13:47:13 -0700
Subject: [Buildroot] [PATCH 1/1] fs: add uimage support w/ example for
 cpio
In-Reply-To: <1366229731-13024-1-git-send-email-spenser@gillilanding.com>
References: <1366225654-11562-1-git-send-email-spenser@gillilanding.com>
 <1366229731-13024-1-git-send-email-spenser@gillilanding.com>
Message-ID: <6c9a7e80-412a-431f-87ac-a0950ada3557@CO9EHSMHS022.ehs.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Apr 17, 2013 at 03:15:30PM -0500, Spenser Gilliland wrote:
> From: Spenser Gilliland <Spenser309@gmail.com>
> 
> Adds uimage support for various root filesystems.  Uimage support is needed when
> using the bootm command in uboot.  This provides both a simple infrastructure
> similar to the current BR2_TARGET_ROOTFS_$(2)_GZ for adding compression. To
> define the a rootfs should have a UIMAGE wrapper simply create the
> BR2_TARGET_ROOTFS_$(2)_UIMAGE symbol.
> 
> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Tested-by: Soren Brinkmann <soren.brinkmann@xilinx.com>

	S?ren
