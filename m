From: Andrea Benini <andreabenini@gmail.com>
Date: Sat, 26 Nov 2011 10:46:55 +0100
Subject: [Buildroot] MySQL Server Package, help needed
Message-ID: <CAOrUntZRB7JSVt+WFn3bOfQd9WiYfN-qx9c0iRsO_cZ+qObYSw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Guys,
I've used buildroot and uclibc for a while and I'm now stucked with a
package I'd like to build.
Target Architecture: i386, variant: i686. Buildroot 2011.08 stable
I'd like to add MySQL to the package list, I'd like to have a MySQL daemon
installed (mysqld), not just the client interface.
MySQL Server is not yet supported due to cross compiling issues I suppose.
I was wondering if someone else has a ready made package for MySQL, I've
tried several solutions grabbed all around after a lot of google searches
(from: Voltz, Zuerker, fork on googlecode, and few tips taken from Oracle)
but I'm still stuck here due to different compiling issues. I've tried to
build my own package as well but MySQL seems to be tricky to handle in a
toolchain. So I'm still stuck at the starting point.
Is there someone else that has already maded it with 2011.08 buildroot ?
may I see package files for it ?
I'm really interested and I'm trying to fix it, but without success for now.

Thanks in advance for your reply

Ben
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111126/22eb76fc/attachment.html>
