From: Alexander Khryukin <alexander@mezon.ru>
Date: Sun, 4 Nov 2012 20:02:22 +0300
Subject: [Buildroot] new perl build issue
Message-ID: <CABtOAfw6A4jH1h1W1Bbm7kKsmz_hJLymP8JRBo5A6a4o09wS8g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi.
I'm trying to build new perl package
and get error
http://pastie.org/5181814


FATAL: kernel too old
The program compiled OK, but exited with status 1.
You have a problem.  Shall I abort Configure [y]
Ok.  Stopping Configure.

Looks like perl package get kernel version string via uname or /proc
2.6.32-279.9.1.el6.x86_64 my kernel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121104/820319b0/attachment.html>
