From: JNY <jny0@hotmail.com>
Date: Wed, 1 Sep 2010 02:35:51 -0700 (PDT)
Subject: [Buildroot]  EXT2-fs error
Message-ID: <29591683.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,

I keep getting the following error when trying to access files on my target
system:

EXT2-fs error (device hda1): ext2_lookup: deleteed inode referenced: 31372

(the inode reference number changes depending upon what file I'm
interrogating)

If I try to e2fsck /dev/hda1, I get the following warning:

/dev/hda1 is mounted.
WARNING!!! Running e2fsck on a mounted filesystem mat cause SEVERE
filesystem demage.

The device is zeroed with dd before installation, which is done from a USB
stick containing the image.  What point is good to e2fsck (before
installaion of the image or after)?  How do I unmount hda1 (which is a flash
drive, and the only storage device on the system), or should I just do so
mounted?

Regards,
JNY
-- 
View this message in context: http://old.nabble.com/EXT2-fs-error-tp29591683p29591683.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
