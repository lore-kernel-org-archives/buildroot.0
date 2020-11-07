From: C Larbi <pkl2000us@gmail.com>
Date: Sat, 7 Nov 2020 23:55:47 +0000
Subject: [Buildroot] Issue with building HOST-LIBXML-PARSER-PERL
Message-ID: <CANVomh-mxky6fEdMHY5cVi2oLt+Tb56NbK8F7mw3jMrCYN8xPw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all.
I am newbie to buildroot and open source in general so please endulge me :)

I am currently trying to test out a KIOSK application using Webkitgtk on a
raspberry pi 4

My build machine is a fedora32 distro

I started out with the "raspberrypi4_defconfig"

Later added graphic libraries (: Xorg, mesa etc) to give me a graphics
stack.


PROBLEM:
Building host-libxml-parser-perl package always fails.

It displays the error message "No targets specified and no makefile found"
in the building stage.

Also in the configuration stage, i get the warning that EXPAT cannot be
found in the standard library directories


I did some digging around in the documentation and came up with following
points

1. I can confirm that libexpat.so is in host/lib

2. It looks to me like this is a perl package with a Makefile.pl file.

3. Looking in the .mk file for the package, i don't see any support for the
perl infrastructure.

Any support will be greatly appreciated as i have spent the whole day
trying to figure out the issue

Regards
Cerezo
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201107/f0eaa640/attachment.html>
