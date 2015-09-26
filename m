From: Dinesh Guleria <din.gulu.er@gmail.com>
Date: Sat, 26 Sep 2015 20:46:31 +0530
Subject: [Buildroot] free electron training question --
	embedded-linux-labs.pdf
Message-ID: <CAKpDV8vowAb3vj0_jebPo3BmGxLFiV+FoKiEaipGOiy4o10Frw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Buildroot team,

I have question from page 27 of following doc embedded-linux-labs.pdf.
Attached image.

Here in figure UBI use to go in MDT partition.

Does following also goes into individual MDT partition  :--
AT91Bootstrap, U-Boot, U-Boot env & U-Boot env backup

Or these (AT91Bootstrap, U-Boot, U-Boot env & U-Boot env backup ) also goes
into NAND Flash at predefined location which are not MDT partiton ?

Please suggest.

Regards,
Dinesh
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150926/68c95a08/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: mtd_partition.png
Type: image/png
Size: 103414 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150926/68c95a08/attachment.png>
