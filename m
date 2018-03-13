From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 13 Mar 2018 22:05:09 +0100
Subject: [Buildroot] [PATCH 04/22] package/x11r7/xapp_xfontsel: bump version
 to 1.0.6
In-Reply-To: <20180313210527.309-1-bernd.kuhls@t-online.de>
References: <20180313210527.309-1-bernd.kuhls@t-online.de>
Message-ID: <20180313210527.309-4-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added all upstream hashes, added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xfontsel/xapp_xfontsel.hash | 9 +++++++--
 package/x11r7/xapp_xfontsel/xapp_xfontsel.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_xfontsel/xapp_xfontsel.hash b/package/x11r7/xapp_xfontsel/xapp_xfontsel.hash
index 40f55236f0..a09df5585b 100644
--- a/package/x11r7/xapp_xfontsel/xapp_xfontsel.hash
+++ b/package/x11r7/xapp_xfontsel/xapp_xfontsel.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2013-May/002213.html
-sha256	170d8550b96fb47b04db6181b947e6f6b8b97f4df5d691c351a278480cc931bf	xfontsel-1.0.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-March/002861.html
+md5 13150ff98846bf6d9a14bee00697fa47  xfontsel-1.0.6.tar.bz2
+sha1 3fd8d78cc270030b41298170c3e5222065dd1cfd  xfontsel-1.0.6.tar.bz2
+sha256 25aa0b7c4262f5e99c07c2b96e00e4eb25b7e53f94fa803942af9d0e8da3001c  xfontsel-1.0.6.tar.bz2
+sha512 2f6bc51549a302404cdaf9a5a825add383953fcbb2a0c7076691cefd4dd7e4a3c772c047be74101c8486f75d03ce0bd3e65ede14e91732cf2a932810441c9099  xfontsel-1.0.6.tar.bz2
+# Locally computed
+sha256 a27097bcc5cdf4fa5d761dd4e5cea1f41911c51b0a7d9da6e3a48f69d9fd0c09 COPYING
diff --git a/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk b/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk
index 781b4d3542..9dea4299b3 100644
--- a/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk
+++ b/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XFONTSEL_VERSION = 1.0.5
+XAPP_XFONTSEL_VERSION = 1.0.6
 XAPP_XFONTSEL_SOURCE = xfontsel-$(XAPP_XFONTSEL_VERSION).tar.bz2
 XAPP_XFONTSEL_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XFONTSEL_LICENSE = MIT
-- 
2.11.0
