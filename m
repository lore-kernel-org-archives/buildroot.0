From: Mike Zick <minimod@morethan.org>
Date: Mon, 17 Feb 2014 05:42:28 -0600
Subject: [Buildroot] [PATCH 1/1] iso9660: Added support for overlay
 directories
In-Reply-To: <5301B4E9.60902@mind.be>
References: <1391549148-31993-1-git-send-email-martin@barkynet.com>
 <5301B4E9.60902@mind.be>
Message-ID: <20140217054228.20297e71@core2quad.morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 17 Feb 2014 08:06:17 +0100
Arnout Vandecappelle <arnout@mind.be> wrote:

> On 04/02/14 22:25, Martin Bark wrote:
> > This patch adds a variable BR2_TARGET_ROOTFS_ISO9660_OVERLAY that
> > is similar to BR2_ROOTFS_OVERLAY except the files are placed in the
> > iso9660 file system.
> > 
>

Since Buildroot only builds root filesystems for the target device,
it would probably be safe to drop the "TARGET_" distinction from
that variable name.

Mike

> > Signed-off-by: Martin Bark <martin@barkynet.com>  
> 
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
>  I haven't tried it but it looks obviously-correct.
