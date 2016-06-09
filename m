From: Peter Thompson <peter.macleod.thompson@gmail.com>
Date: Thu, 9 Jun 2016 15:18:34 -0600
Subject: [Buildroot] patch for sdl2_gfx, sdl2_image, sdl2_ttf
Message-ID: <CAGrGpJAcPA=Uif1YkULLTyMpqE28fX-2sqRV6Oa5Lj4yC8jNHw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Attached is a patch which adds sdl2_gfx, sdl2_image and sdl2_ttf to
Buildroot-2016.05.   The patch has been tested by running some of my SDL2
applications on a rootfs created by Buildroot-2016.05 with the attached
patch applied. The test was on igepv2 board using linux-omap-2.6.37-6.

If the patch is useful, and you would like me to submit/publish it more
formally, (eg via git commit) please let me know.  This is my first time
submitting a patch anywhere - hence my hesitancy.


Peter
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160609/98295d36/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot-2016.05-peterpatch.patch
Type: text/x-patch
Size: 16071 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160609/98295d36/attachment.bin>
