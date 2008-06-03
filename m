From: Christopher Taylor <chtaylo3@gmail.com>
Date: Tue, 3 Jun 2008 19:18:46 -0400
Subject: [Buildroot] root fs
Message-ID: <2590773a0806031618y36f52acdub806d896da6ad0ae@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Does anyone know how to get the root fs to be built from scratch?  I
deleted it with a make clean in buildroot and now some of the files
aren't installing into the root dir; most notably: /etc/passwd,
/etc/shadow, and /usr/share/udhcpd/default.script

There are probably a few others so instead of hunting them down I'd
like to try and get BR/BB to install them over again.

Any help appreciated!

-Chris
