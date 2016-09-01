From: Petr Kulhavy <brain@jikos.cz>
Date: Thu,  1 Sep 2016 16:51:32 +0200
Subject: [Buildroot] boot/uboot: allow multiple target selection
Message-ID: <1472741494-7043-1-git-send-email-brain@jikos.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,

I'm sending two improvements to boot/uboot.

The first patch is a minor fix to make sure the SPL target is always build by
the make process.

The other patch changes the current "choice" type of selection of the U-boot
target format to a multi-selection. This might be useful for generating
multiple uboot image formats at once. E.g. one for serial load (which typically
contains some RBL formatting) and one to be stored on a filesystem or in the
flash. So far this was not possible to do.

Any comments are welcome.

Thanks
Petr
