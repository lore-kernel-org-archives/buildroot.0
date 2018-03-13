From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 13 Mar 2018 22:05:12 +0100
Subject: [Buildroot] [PATCH 07/22] package/x11r7/xapp_xload: bump version to
 1.1.3
In-Reply-To: <20180313210527.309-1-bernd.kuhls@t-online.de>
References: <20180313210527.309-1-bernd.kuhls@t-online.de>
Message-ID: <20180313210527.309-7-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added all upstream hashes, added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xload/xapp_xload.hash | 9 +++++++--
 package/x11r7/xapp_xload/xapp_xload.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_xload/xapp_xload.hash b/package/x11r7/xapp_xload/xapp_xload.hash
index 418ce55634..99d9cabb0e 100644
--- a/package/x11r7/xapp_xload/xapp_xload.hash
+++ b/package/x11r7/xapp_xload/xapp_xload.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2013-August/002285.html
-sha256	83f8e6260435f1df2e2e5036bb3325688b79f0b33069ef445eff5058d127e078	xload-1.1.2.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-March/002865.html
+md5 29afafdffe97f809d43a41db9dd63f25  xload-1.1.3.tar.bz2
+sha1 fd5053d38551883309863c2a43de2ceffa908a50  xload-1.1.3.tar.bz2
+sha256 f34e4803871d771325cfe52bebd98cc5b6040d3f065184ec73de436f9a375907  xload-1.1.3.tar.bz2
+sha512 8dbc4f0cee7b30d7381be819152b27653d9b0049266e59bde2e2c972a88c4f2bdea766fc407bbdfef15d0aab30fedc756189a1048170a812853133a5094fe7a5  xload-1.1.3.tar.bz2
+# Locally computed
+sha256 a09b31d26e4d2781eef1e71f39789f86cad6d81153e72064f45875910fa6258f COPYING
diff --git a/package/x11r7/xapp_xload/xapp_xload.mk b/package/x11r7/xapp_xload/xapp_xload.mk
index 364d247a95..b44a51b5fd 100644
--- a/package/x11r7/xapp_xload/xapp_xload.mk
+++ b/package/x11r7/xapp_xload/xapp_xload.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XLOAD_VERSION = 1.1.2
+XAPP_XLOAD_VERSION = 1.1.3
 XAPP_XLOAD_SOURCE = xload-$(XAPP_XLOAD_VERSION).tar.bz2
 XAPP_XLOAD_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XLOAD_LICENSE = MIT
-- 
2.11.0
