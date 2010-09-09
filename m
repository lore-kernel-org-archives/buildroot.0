From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 9 Sep 2010 12:26:23 +0200
Subject: [Buildroot] [PATCH] enable terminal type configuration for inittab
Message-ID: <AANLkTikT3ePxWGquiKyncrRqs9QsifkHv9vTfe_j8=2x@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've made a patch to be able to configure terminal type for inittab
along with baudrate and tty* device. What about making tty device
definition just a string? There some more device names like ttyATx for
Atmel etc.?

Can someone tell me, how can I send patches through gmail web
interface correctly as inlined text?

Regards,
Yegor
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0002-terminal-type.patch
Type: application/octet-stream
Size: 1923 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100909/139c7262/attachment.obj>
