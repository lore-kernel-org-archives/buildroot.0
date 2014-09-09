From: Sylvain LG <forum@sylvainlegourr.com>
Date: Tue, 9 Sep 2014 11:20:13 +0200
Subject: [Buildroot] General questions
Message-ID: <CAK9TtU0uPXcqZNEcgxjrs_Gnm=jMECRPDAbKMAjoCTxC-Ycb2g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I develop some projects with Qt and run them on ARM embedded systems. OS is
built by Buildroot.

Since Qt 5.3.1 and QtCreator 3, GDB must support Python scripting.

?The selected build of GDB does not support Python scripting it cannot be
used in Qt Creator?


I have to recompile gdb with these options:

./configure --prefix /usr/local/gdb-python2 --with-python

What is the right way to achieve this?

Could someone give me the guideline to contribute to Buildroot?


Regards,

Sylvain
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140909/fc01ef26/attachment.html>
