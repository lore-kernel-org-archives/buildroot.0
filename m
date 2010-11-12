From: Frederik Pasch <fpasch@googlemail.com>
Date: Fri, 12 Nov 2010 16:45:54 +0100
Subject: [Buildroot] gpsd building fails while compiling Qt bindings
Message-ID: <AANLkTi=aFtH1wFxm8HrRgXh+7Yp7OLTU1UijN_eECqpO@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is caused because configure tries to use the host-qmake.

The attached patch should solve this issue.

Maybe building the Qt Bindings should also be a config-parameter...

Frederik Pasch
-------------- next part --------------
A non-text attachment was scrubbed...
Name: gpsd.patch
Type: text/x-patch
Size: 597 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101112/20a82272/attachment.bin>
