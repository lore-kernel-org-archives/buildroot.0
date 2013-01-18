From: Przemyslaw Wrzos <przemyslaw.wrzos@calyptech.com>
Date: Fri, 18 Jan 2013 12:10:05 +1100
Subject: [Buildroot] New kernel source mode [Proposal]
References: <EE5E77B503DE9A478B63A89AAD2585EDB66A2F@vpane.excalyptech.com>
 <50F50A74.8000501@relinux.de>
Message-ID: <EE5E77B503DE9A478B63A89AAD2585EDB66A39@vpane.excalyptech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stephen,

Just an update to the patch I sent in yesterday. Between trying to get
both the generic and non-generic versions working I seem to have
introduced a bug at some point into my proposed patch for the linux
kernel. I'm including an updated version for you to look at (just a
missing line that caused the download step to try to download a
nonsensical non-existent file).

One other thing I should note about the patch which I didn't elaborate
on yesterday. After digging around in the linux source code there
doesn't seem to be a way to perform the buildroot_defconfig make step in
an out of tree build so I had to settle for simply copying the
configuration file across.

Cheers,
Przemyslaw Wrzos
-------------- next part --------------
A non-text attachment was scrubbed...
Name: linux-dir-source.patch
Type: application/octet-stream
Size: 3931 bytes
Desc: linux-dir-source.patch
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130118/85d7026f/attachment.obj>
