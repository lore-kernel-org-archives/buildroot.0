From: Ben Ben <carmazen84@gmail.com>
Date: Wed, 21 Jan 2015 11:39:03 +0100
Subject: [Buildroot]  [PATCH 1/1] nvidia-tegra23: new package
Message-ID: <CA+GxxTdWyTkj+HJWr8J0Zf7p3Gm7JgVcd6_msqJF9yvN-WSAMQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I tried this patch directly from git://git.busybox.net/~ymorin/git/buildroot
yem/gfx

I got some header problems with opengl.
Qt5 looking for sysroot/usr/include/GLES/gl2platform.h and can't find it.

I tried with mesa3d instead of tegra driver. That's works fine.

I assume that this header should come with opengl-registery ?

I have tegra3 platform, nvidia-tergra23 binaries and codecs are selected.
X11 ABI 14 version.

Best regards,
Benoit.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150121/3010ea77/attachment.html>
