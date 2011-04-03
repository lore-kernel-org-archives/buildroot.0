From: Charles Krinke <charles.krinke@gmail.com>
Date: Sun, 3 Apr 2011 09:34:36 -0700
Subject: [Buildroot] working with u-boot
Message-ID: <BANLkTi=5sFsogvPiXWNvZaCO=JcyiZ0Wqg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am editing and recompiling u-boot a bit from within buildroot and
currently am doing this to get a "clean"

$buildroot   cd output/build/u-boot
$u-boot   rm -rf .o
$u-boot   cd ../../../
$buildroot rm output/build/u-boot/.configured
$ make

And this gets me a fresh compile of u-boot.

Is there a better way to do this?

-- 
Charles Krinke

p.s. make help shows

make {uclibc/busybox/linux26}-config

and I suspect it should show

make {uclibc/busybox/linux26}-*menu*config
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110403/4a6dae9d/attachment.html>
