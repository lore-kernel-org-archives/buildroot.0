From: Sven Neumann <s.neumann@phase-zero.de>
Date: Mon, 19 Jan 2009 15:32:55 +0100
Subject: [Buildroot] DirectFB touchscreen modules
Message-ID: <1232375575.8906.2.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

attached patch adds some more input drivers, mostly for touch screens,
that can be enabled when configuring DirectFB. It also moves all input
related config options to a common BR2_PACKAGE_DIRECTFB_INPUT prefix.


Sven


-------------- next part --------------
A non-text attachment was scrubbed...
Name: directfb.diff
Type: text/x-patch
Size: 4127 bytes
Desc: not available
Url : http://lists.busybox.net/pipermail/buildroot/attachments/20090119/1604fa24/attachment.bin 
