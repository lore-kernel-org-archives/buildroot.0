From: Bryce Schober <bryce.schober@gmail.com>
Date: Mon, 23 Sep 2013 11:58:12 -0700
Subject: [Buildroot] [BFCI] HOWTO Defconfig for host package
Message-ID: <CAJpxd06FJXZde5VS9BdifeH5ejSDDWUmHUoA8x3tt6FJ+77A-Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[Buildroot for Complete Idiots] question here:

How do I configure (in a defconfig) to build a host package variant? I was
guessing that BR2_PACKAGE_HOST_FOO would work, but apparently not. I've
defined a new generic package, and its host-foo target works as expected,
but I don't see anything obvious in the manual about how to get this in my
defconfig.

I'm on an ancient version of buildroot here, so that may complicate
things...

<><  <><  <><
Bryce Schober
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130923/dd5dd996/attachment.html>
