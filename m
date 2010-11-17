From: Stanislav Bogatyrev <realloc@gmail.com>
Date: Wed, 17 Nov 2010 14:49:06 +0300
Subject: [Buildroot] OF FDT compilation support
Message-ID: <AANLkTikeJ-mbrieukd24z7zZi=hCRMNPhMZWP+Okm2oX@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a little patch to support OpenFirmware Flattened Device Tree
compilation.
I didn't found how to do it with vanilla buildroot source, so this is
added this to kernel compilation makefile, maybe it's better to put it
somewhere else.

Could anybody tell me if it's appropriate way in terms of buildroot ideology?
Thank you!

Best regards,
Stanislav Bogatyrev aka realloc()
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-Add-Flattened-Device-Tree-compilation-support-for-Po.patch
Type: text/x-diff
Size: 4270 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101117/5bce8c24/attachment.bin>
