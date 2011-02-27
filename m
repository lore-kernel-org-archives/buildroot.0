From: bao bui <buiqbao@gmail.com>
Date: Sun, 27 Feb 2011 09:07:03 +0700
Subject: [Buildroot] Compile ghostscript 9.01 with buidroot
Message-ID: <AANLkTi=gaJT9KWLqCQwYCQE5vq3kQU3LnLNVpyapfUVW@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Please can any one tell me how to add ghostscript 9.01 to buidroot. I want
to support printing for my mini2440 board.

In the ghostscript configure script, it call to other configure script in
jbig2dec and tiff folder. When buildroot run, the first call to configure
use buildroot parametter (arm-linux-gcc, etc), but after that, every call to
configure script use the host parametter (gcc, etc). I don't know how to fix
it.

Thank you very much
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110227/4f8478da/attachment.html>
