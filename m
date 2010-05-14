From: Chih-Min Chao <cmchao@gmail.com>
Date: Fri, 14 May 2010 16:12:05 +0800
Subject: [Buildroot] [PATCH] fix broken path in arm_toolchain_defconfig
Message-ID: <AANLkTikVbjYf9S-NaAT2Op_js9h00nnH020Y-NHTJ7Wc@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The path of device_table.txt in arm_toolchain_defconfig is broken.
The patch fix it and use target/generic/device_table.txt as default setting
Please see the attached
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100514/16ccf5a8/attachment.htm>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: arm_toolchain_defconfig.patch
Type: text/x-patch
Size: 688 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100514/16ccf5a8/attachment.bin>
