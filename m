From: AAlex_ <earthquake.de@freenet.de>
Date: Fri, 13 Apr 2018 00:44:32 -0700 (MST)
Subject: [Buildroot] How to set file capability when root-fs is read-only.
Message-ID: <1523605472918-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
how to deal with file-capabilities (setcap) when buildroot generates the
root-fs and mount as read only is selected?
I have an executable that needs several file-capabilities (eg. cap_sys_boot)
because the executable should not run as root-user.
Currently I use the rootfs as read-write file-system and the setcap is
called during Startup-Process.
How can buildroot set the capabilites? 
The application is build by buildroot as a package and calling setcap in
_INSTALL_TARGET_CMDS fails.

Regards,
Alex



--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
