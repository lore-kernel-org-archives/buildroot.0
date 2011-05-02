From: Charles Krinke <charles.krinke@gmail.com>
Date: Mon, 2 May 2011 16:24:15 -0700
Subject: [Buildroot] make modules
Message-ID: <BANLkTikhgQBmW20=0UM5BeQLqBz_kSoC6w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Never mind. A cd to buildroot-2011.02/output/build/linux-xxx followed by

make modules

works. Should have tested it first. Apparently the CROSS_COMPILE variable
and ARCH are setup correctly so I can indeed just do a make from the linux
output/build directory.

-- 
Charles Krinke
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110502/cd143b20/attachment-0001.html>
