From: Victor Hiairrassary <victor.hiairrassary.ml@gmail.com>
Date: Mon, 27 May 2013 00:08:41 +0200
Subject: [Buildroot] f2fs support
Message-ID: <51A287E9.2090308@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I am trying to add support for f2fs file system in buildroot.
For now I have already added f2fs-tools for the host, i.e. mkfs.f2fs.

But I cannot create a f2fs file system image since mkfs.f2fs takes
a device as parameter (/dev/sda1 for example). This is different than
jffs2's syntax : '$(MKFS_JFFS2) -d $(TARGET_DIR) -o $@' for example,
which takes a directory as input.

Does anybody have an idea about this issue?

Best regards,
Victor Hiairrassary
