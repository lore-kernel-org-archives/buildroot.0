From: David Evans <sir.dje1812@gmail.com>
Date: Fri, 31 Jul 2015 20:02:47 +0100
Subject: [Buildroot] Using UBI-FS with Altera SoC devices booting out of QSPI
Message-ID: <CAC322bhR=V11FhUBGtrsaPsq1EicmAMYQwRwYyL5vxLFbd7ziQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear BuildRoot,

I am booting a Cyclone-V SoC from QSPI using the Uboot, Kernel and JFFS2
images all created for me by BuildRoot.

I would like to swap out the JFFS2 for UBI-FS, but when I do this I get a
Kernel panic.

end Kernel panic - not syncing: VFS: Unable to mount root fs on
unknown-block(0,0)

Does anyone have any ideas on how to get this working? I have reviewed
documentation on Free-Electrons to no avail.

Regards,

DJE
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150731/0aa15983/attachment.html>
