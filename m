From: JNY <jny0@hotmail.com>
Date: Tue, 7 Sep 2010 09:58:21 -0700 (PDT)
Subject: [Buildroot] EXT2-fs error
In-Reply-To: <29591683.post@talk.nabble.com>
References: <29591683.post@talk.nabble.com>
Message-ID: <29641601.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> Out of curiosity, a USB flash device, or CF, or NAND flash, or ?

Not sure about the USB stick, but the flash device (see below) on the target
is NAND.

To clear up any confusion: 
-USB stick is the means of transfering the image
-flash device is the target device memory

>> I don't have a file called rootfs.ext2.  I have the following files:
>> rootfs.i486.tar
>> rootfs.i486.tar.bz2

>Which of these files are you transferring to the flash device, and how?
I'm transfering the bzImage file to the flash device, and referencing it
with grub.

The USB stick always comes up clean when I e2fsck both partitions (even with
a force -f).

Is it possible that when the file system is created by Buildroot, that it
could need some kind of fsck, before it is transfered to the USB stick?


-- 
View this message in context: http://old.nabble.com/EXT2-fs-error-tp29591683p29641601.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
