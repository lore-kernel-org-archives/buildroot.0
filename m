From: hayate <hayatelee@gmail.com>
Date: Mon, 4 Feb 2013 17:15:06 +0800
Subject: [Buildroot] gcc 4.7.2 and arm OABI
Message-ID: <CAJXWAww6JFbdAYotGH1n2xEFJ=AFDrtEJEo=BhiRe4dCrtVr=g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The OABI is disabled in menuconfig with gcc 4.7.x, the latest gcc with OABI
support is 4.6

But recently I found that if configure gcc 4.7 with --enable-obsolete, it
can be built with OABI support (--with-abi=apcs-gnu)

Is there any possibility to build gcc 4.7 with OABI in buildroot?

regards,
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130204/14a794d2/attachment.html>
