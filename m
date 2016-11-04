From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  4 Nov 2016 06:52:55 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/openvpn: bump to version 2.3.13
Message-ID: <20161104055255.22119-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/openvpn/openvpn.hash | 4 ++--
 package/openvpn/openvpn.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index ce005d3..0c5cb09 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,2 +1,2 @@
-# Locally calculated after checking pgp signature
-sha256	13b963414e2430215981868c77b9795d93653ee535a2d73576f7bb2c28200abc 	openvpn-2.3.12.tar.xz
+# Locally calculated
+sha256 9cde0c8000fd32d5275adb55f8bb1d8ba429ff3de35f60a36e81f3859b7537e0  openvpn-2.3.13.tar.xz
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 0e59fdc..cd0a2d1 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.3.12
+OPENVPN_VERSION = 2.3.13
 OPENVPN_SOURCE = openvpn-$(OPENVPN_VERSION).tar.xz
 OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf openssl
-- 
2.10.1
