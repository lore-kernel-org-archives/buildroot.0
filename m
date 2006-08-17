From: NuNash <joebwa@gmail.com>
Date: Thu, 17 Aug 2006 08:46:22 -0700
Subject: [Buildroot] toolchain issues
Message-ID: <7ea441dd0608170846n43baf986wa9e190a83877854d@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm able to successfully generate a toolchain for armeb platform.
However, there seems to be some issues with the toolchain
produced.

One of the issue is there is no crt0.o in the lib folder. Due to
this, when I compile a small C program, it produces really
small binary and it does not run on the target. I do have
a pre-built toolchain for the same platform. It produces correct
flat binary.

I've enabled static linking.

Any ideas?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20060817/569aed60/attachment.html 
