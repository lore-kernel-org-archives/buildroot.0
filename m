From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Jul 2014 22:35:12 +0200
Subject: [Buildroot] [PATCH] qemu/mips64-malta: update defconfig to
 Linux 3.15.x
In-Reply-To: <20140721201340.GA31551@waldemar-brodkorb.de>
References: <20140721201340.GA31551@waldemar-brodkorb.de>
Message-ID: <20140721223512.2207d08c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Mon, 21 Jul 2014 22:13:41 +0200, Waldemar Brodkorb wrote:

> Update to 3.15.x, use Ext2 instead of Ext4.
> Genext2fs generates ext2 filesystem, so better use ext2
> as used for qemu/mips-malta and qemu/mipsel-malta.

Well, actually, Buildroot can generate ext3 and ext4 filesystems:
http://git.buildroot.net/buildroot/tree/fs/ext2/Config.in#n13.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
