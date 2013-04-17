From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Date: Tue, 16 Apr 2013 17:47:26 -0700
Subject: [Buildroot] [PATCH 1/1] fs: add uimage support w/ example for
 cpio
In-Reply-To: <1365703381-9560-1-git-send-email-spenser@gillilanding.com>
References: <1365703381-9560-1-git-send-email-spenser@gillilanding.com>
Message-ID: <922402b4-3117-4093-ad58-f48bd49b4ad2@DB8EHSMHS023.ehs.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Apr 11, 2013 at 01:03:01PM -0500, Spenser Gilliland wrote:
> From: Spenser Gilliland <Spenser309@gmail.com>
> 
> Adds uimage support for various root filesystems.  Uimage support is needed when
> using the bootm command in uboot.  This provides both a simple infrastructure
> similar to the current BR2_TARGET_ROOTFS_$(2)_GZ for adding compression. To
> define the a rootfs should have a UIMAGE wrapper simply create the
> BR2_TARGET_ROOTFS_$(2)_UIMAGE symbol.
> 
> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>

It still has the white space errors. Other than that, it's still
working. Feel free to add my Tested-by.

	S?ren
