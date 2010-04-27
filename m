From: Cameron Hutchison <lists@xdna.net>
Date: Tue, 27 Apr 2010 03:50:45 -0000
Subject: [Buildroot] Building libglib2 on 2009.11 with ext-toolchain
Message-ID: <699c.4bd65f15.82e9a@getafix.xdna.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am trying to build libglib2 using buildroot 2009.11 using an external
toolchain. I am hitting the problem described here:

http://lists.busybox.net/pipermail/buildroot/2010-February/031955.html

In a message in that thread, Thomas Petazzoni said:

  For the record, I've been able to fix this issue by using a more recent
  gtk-doc.m4 version than the one I had in my repo. So now, libglib2
  build with LIBTOOL_PATCH=YES and AUTORECONF=YES works.

Can someone tell me where gtk-doc.m4 comes from and how I update it? 

I am building on a Debian unstable x86-64 box, cross-compiling to ARM,
using the buildroot toolchain installed as an external toolchain. At
this stage, I do not have to option to go to a later version of
buildroot.

I am just looking for a quick and dirty solution so that I can get
latencytop built for the target (AT91SAM9260EK). Latencytop needs glib,
but now I'm stuck getting that built.

Thanks
