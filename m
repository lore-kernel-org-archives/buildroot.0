From: Paul <paul@bluecordial.com>
Date: Thu, 29 Sep 2016 16:03:47 +0100
Subject: [Buildroot] Interfaces not coming up on DSA
Message-ID: <5C6DB3AE-3775-4761-BF1A-9C4B101A7F37@bluecordial.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After upgrading to buildroot 2016.08.1 our dsa interfaces do not automatically come up, using an existing 4.5.4 kernel. Ifconfig lan1 up brings up the interface however not able to route, says destination unreachable. If we run an ifup ?a everything works as normal. This was not the case using a previous version of buildroot.

 

Kind regards

Paul Ashford

 

Contact Information: 

m: +44 (0)7885 469812

e: paul at bluecordial.com

skype: paulashford1975

twitter: @pdashford

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160929/a1de5eea/attachment.html>
