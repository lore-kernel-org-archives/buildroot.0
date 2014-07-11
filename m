From: Michael Sumulong <msumulong@gmail.com>
Date: Fri, 11 Jul 2014 13:58:50 -0400
Subject: [Buildroot] nasm package error installing to target
Message-ID: <CABDNR14V6t+yxJN9-y5ZdU+iwpx+wM0e5Sb+gq1S48Q4Yq=8LQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm trying to install the nasm package to my target but I get the following
error when buildroot 2014.05 tries to compile it:

>>> nasm 2.11.02 Installing to target
PATH="/home/mbs/Desktop/testing/staging/buildroot-2014.05/output/host/bin:/home/mbs/Desktop/testing/staging/buildroot-2014.05/output/host/sbin:/home/mbs/Desktop/testing/staging/buildroot-2014.05/output/host/usr/bin:/home/mbs/Desktop/testing/staging/buildroot-2014.05/output/host/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
/usr/bin/make -j5
DESTDIR=/home/mbs/Desktop/testing/staging/buildroot-2014.05/output/target
install -C
/home/mbs/Desktop/testing/staging/buildroot-2014.05/output/build/nasm-2.11.02/
make[1]: Entering directory
`/home/mbs/Desktop/testing/staging/buildroot-2014.05/output/build/nasm-2.11.02'
mkdir -p /usr/bin
/usr/bin/install -c nasm /usr/bin/nasm
/usr/bin/install: cannot remove ?/usr/bin/nasm?: Permission denied
make[1]: *** [install] Error 1
make[1]: Leaving directory
`/home/mbs/Desktop/testing/staging/buildroot-2014.05/output/build/nasm-2.11.02'
make: ***
[/home/mbs/Desktop/testing/staging/buildroot-2014.05/output/build/nasm-2.11.02/.stamp_target_installed]
Error 2


I'm fairly new to buildroot and I'm not entirely sure what's going on here.
I've tried looking at nasm.mk file but its pretty much just relying on the
autotools-package to perform the build.

Mike
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140711/2a416284/attachment.html>
