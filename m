From: =?ISO-8859-1?Q?Jo=E3o_Ferreira?= <joaoahf@gmail.com>
Date: Tue, 13 Mar 2012 00:49:12 +0000
Subject: [Buildroot] AX25 support packages
Message-ID: <CACQGsYQZMnE-dHw=1a8QKogQ_GNjwDQOZ+4dXnBHs6d-CiB6UQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Buildroot users and developers,

I realized that *buildroot* do not have AX.25 *userland* software support.
Specially the AX25lib and AX25-tools, available at:

   - http://www.linux-ax25.org/pub/libax25/libax25-0.0.12-rc2.tar.gz
   - http://www.linux-ax25.org/pub/ax25-tools/ax25-tools-0.0.10-rc2.tar.gz


So, I made the packages for that software (see attach), and I wonder that
it might be useful for some *buildroot* users (specially those who are
radio amateur).
The packages include one patch, who will bypass the setpgrp() verification
in configure script.

I test that packages using crosscompile (i386->ARM) and everything works as
expected.

Fell free to use that packages as you want, and give some comments about it.

Thank you very much for your good work at this project,

Jo?o Ferreira
MSc student in Communications Networks Engineering
IST / TULisbon
AMRAD / AMSAT-CT member
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120313/b742f98e/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: libax25.tar.bz2
Type: application/x-bzip2
Size: 1771 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120313/b742f98e/attachment.bz2>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: ax25tools.tar.bz2
Type: application/x-bzip2
Size: 1785 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120313/b742f98e/attachment-0001.bz2>
