From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Mon, 14 Oct 2013 10:29:13 +0200
Subject: [Buildroot] Help with selecting package
Message-ID: <525BAB59.4020105@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
I receive a lot of warning during the compilation of a kernel module, 
like this:

WARNING: "videobuf_read_stream" 
[/home/mark/dev/rpiqt5/buildroot-rpi/output/build/sensoray2253-1.2.6/driver/s2253.ko] 
undefined!

"videobuf_read_stream" is defined in media/videobuf-core.h.

How to find which package I have to add to "depends on" and to 
"PACKAGE_DEPENDENCIES" ?
I've already added libv4l.

Mark
