From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Apr 2015 10:13:48 +0200
Subject: [Buildroot] [PATCHv2 02/21] fs: declare phony targets as such
In-Reply-To: <20150413193707.GB29025@free.fr>
References: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1428856685-4403-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150413193707.GB29025@free.fr>
Message-ID: <20150414101348.4e90e3f8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 13 Apr 2015 21:37:07 +0200, Yann E. MORIN wrote:

> This made me think of the trick we use to force a kernel rebuild with
> this newly-created initramfs.
> 
> We're using a post-fs target to force the kerbnel rebuild:
>     ROOTFS_INITRAMFS_POST_TARGETS += linux-rebuild-with-initramfs
> 
> But this rule is not PHONY, and your series does not make it PHONY.
> This could be done in a fallow-up patch, and is not a blocker.

Correct, this could be a patch to linux/linux.mk making this target
a .PHONY target.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
