From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Feb 2018 23:51:35 +0100
Subject: [Buildroot] [PATCH 1/1] fs/cpio: add option to manually specify
 file list
In-Reply-To: <20171026191627.18949-2-sconnor@lynx.com>
References: <Multiple root filesystems for single kernel/toolchain>
 <20171026191627.18949-1-sconnor@lynx.com>
 <20171026191627.18949-2-sconnor@lynx.com>
Message-ID: <20180216235135.248cc872@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 26 Oct 2017 12:16:27 -0700, Seamus Connor wrote:
> For some systems it may be desireable to have an initramfs that is
> smaller than the full root filesystem. This commit adds support for
> creating an initramfs based on a manually specified set of files. It is
> up to the user to define a sensible set of files. This file list could
> either be statically created, or it could be created as the result of a
> pre-fs hook script.
> 
> Signed-off-by: Seamus Connor <sconnor@lynx.com>

Considering the replies from both Yann and Arnout who were both not
very convinced by the approach, and Arnout's idea of using a fakeroot
script to achieve the same thing in a more flexible way, I've marked
this patch as Rejected in our patch tracking system.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
