From: Sven Neumann <s.neumann@raumfeld.com>
Date: Mon, 13 Jul 2009 10:20:58 +0200
Subject: [Buildroot] [PATCH] optional DBus support in wpa_supplicant
Message-ID: <1247473258.4007.7.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

the attached patch adds the buildroot config option
BR2_PACKAGE_WPA_SUPPLICANT_DBUS. With this option enabled the DBus
specific files from wpa_supplicant will be installed to the target and
support for the DBus control interface will be compiled into
wpa_supplicant. Please consider to include this patch.


Sven


-------------- next part --------------
A non-text attachment was scrubbed...
Name: wpa-supplicant-dbus.diff
Type: text/x-patch
Size: 8319 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090713/d57cfec2/attachment.bin>
