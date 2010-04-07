From: Andrew Porritt <aporritt@gogo-robot.com>
Date: Wed, 7 Apr 2010 15:07:14 +0100
Subject: [Buildroot] Error on recompile
Message-ID: <001501cad65b$a1643f30$e42cbd90$@com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

 

I've managed to get buildroot compiling to the end using version 2010.02 and
a version of the nptl branch of uClibc (not the latest version, as it
doesn't work). The first compilation works fime, but if I try to run make
again, it tries to rebuild uClibc, but fails with an undefined reference to
__emutls_get_address in sigaction.c when trying to link libc_so.a. Is this a
problem with buildroot or with uClibc? I'm not sure why it tries to rebuild
uClibc anyway, as nothing should have changed.

 

Thanks

Andrew Porritt

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100407/52def04f/attachment.htm>
