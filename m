From: Assen Stoyanov <softa@ttechgroup.com>
Date: Thu, 2 Nov 2006 02:25:57 +0200
Subject: [Buildroot] How to use a buildroot disk image.
References: <1d09f8b80611011236m74428fd7x3aeb6c31e3605118@mail.gmail.com>
Message-ID: <003001c6fe15$775a9030$6614a8c0@lap>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


----- Original Message ----- 
From: "Will Buik" <willbuik@gmail.com>
To: <buildroot@uclibc.org>
Sent: Wednesday, November 01, 2006 22:36
Subject: [Buildroot] How to use a buildroot disk image.


> I'm really sorry if I missed this in the documentation, but how do I
> install the file system image to an actual disk drive.  I have tried
> using dd to write it to the disk as super block and also just to the
> first partition, but this has not worked.  Thanks in advance.
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
>
> -- 
> No virus found in this incoming message.
> Checked by AVG Free Edition.
> Version: 7.1.409 / Virus Database: 268.13.21/509 - Release Date: 
> 10/31/2006
>
>

Hi Will,
I use this script, if you plan to use x86 arch and LILO boot loader, maybe 
it helps you.

p.p. writing a fresh MBR to the loopback device is problematic, use patch.

Best Regards,
Assen 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: lilo.MBR-in-loopdev.patch
Type: application/octet-stream
Size: 690 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20061102/041c0c80/attachment.obj 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: makeimage.sh
Type: application/octet-stream
Size: 2425 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20061102/041c0c80/attachment-0001.obj 
-------------- next part --------------
No virus found in this outgoing message.
Checked by AVG Free Edition.
Version: 7.1.409 / Virus Database: 268.13.21/509 - Release Date: 10/31/2006
