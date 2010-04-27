From: Alexander (Sasha) Sirotkin <buildroot@browserseal.com>
Date: Tue, 27 Apr 2010 11:23:43 +0300
Subject: [Buildroot] Makefile:285: .config.cmd: No such file or directory
Message-ID: <k2h478c82f01004270123i315d4050zafab34f866bd862b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If I stop (Ctrl-C) the make at some point, something gets broken and no
matter what I do I get the following error message:

-bash-3.1$ make  kb9202_defconfig
Makefile:285: .config.cmd: No such file or directory

-bash-3.1$ make clean
Makefile:285: .config.cmd: No such file or directory

-bash-3.1$ make distclean
Makefile:285: .config.cmd: No such file or directory
make: *** No rule to make target `.config.cmd'.  Stop.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100427/73fd456f/attachment.htm>
