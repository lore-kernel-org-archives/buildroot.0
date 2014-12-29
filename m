From: Boris Lenin <boris.lenin123@gmail.com>
Date: Mon, 29 Dec 2014 15:27:40 +0200
Subject: [Buildroot] building native gcc for target
Message-ID: <CAHBHQYO9BLD1tJKxaR3z5StYXEtUvwBwQZfFNSzpZEcqHyR4gg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I want to have a gcc binary in my target, so I can compile ELFs inside it.
This is for compiling using uClibc as suggested here:
http://www.uclibc.org/toolchains.html

But after I make, I have no gcc in output/target/usr/bin/gcc
I also don't have an option to include gcc in menuconfig->Target
packages->Development Tools

How can I have a working gcc that's using uClibc inside my new rootfs?

Thank you.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141229/a86a08cf/attachment.html>
