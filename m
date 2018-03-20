From: AAlex_ <earthquake.de@freenet.de>
Date: Tue, 20 Mar 2018 07:41:46 -0700 (MST)
Subject: [Buildroot] Using grub-bios.cfg
Message-ID: <1521556906599-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
using a modified grub-bios.cfg dont work. 
File located under <BR2_EXTERNAL_MY_PATH>/board/pc
But instead, buildroot uses grub-bios.cfg under
<BUILDROOT_INSTALL_PATH>/board/pc
Doing the same with an pc-efi target works:
grub-efi.cfg located in <BR2_EXTERNAL_MY_PATH>/board/pc
will be used.
Do i need to specify more than an external path in bios defconfig?

Regards,
Alex





--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
