From: Pascal K <pascalkrauth@gmail.com>
Date: Thu, 17 May 2018 17:40:50 +0200
Subject: [Buildroot] Migrating from buildroot-2016-08 to -2018-02
Message-ID: <CADj18OWYtg91U=KqSuCyC8G5cp8zDD7z6p2Y+z-NxmhE4cpa3w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everyone,

I just tried to replace our buildroot-2016-08 environment with
buildroot-2018-02 and run into a small problem.

Usually I tried to create a new out-of-Tree, out-of-Source build using:
"make BR2_EXTERNAL=../ O=../../beaglebone_build beaglebone_defconfig" from
the buildroot main directory, which did create the directory
"beaglebone_build" and took care of the configuration.

Now I am kind of stuck, I did create the external.desc file with a name
inside "beaglebon_build" and created a Config.in and external.mk file there
since this is not handled like back with 2016.08.
So if I change into my build folder "beaglebone_build" I cannot run "make
menuconfig" since it does come back with an "make: *** No rule to make
target 'menuconfig'.  Stop.".

I do question if my old way of starting a out-of-Tree, out-of-Source build
is still recommended?

Best regards,
Pascal
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180517/f12dbff4/attachment.html>
