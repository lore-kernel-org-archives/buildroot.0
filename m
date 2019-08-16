From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 16 Aug 2019 11:13:15 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/autofs: bump to version 5.1.5
Message-ID: <20190816091315.16669-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for license files

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/autofs/autofs.hash | 6 +++++-
 package/autofs/autofs.mk   | 2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/autofs/autofs.hash b/package/autofs/autofs.hash
index 1f2060bdef..e4c1ecaeb2 100644
--- a/package/autofs/autofs.hash
+++ b/package/autofs/autofs.hash
@@ -1,2 +1,6 @@
 # From https://www.kernel.org/pub/linux/daemons/autofs/v5/sha256sums.asc
-sha256 8fce30ee51ffd528fe1a4e8374ef57f43367e1f123030e175fb1b1cf15bc1722  autofs-5.1.4.tar.xz
+sha256 23afdad9e2fd6d41b1900be8cfecfd5aae0ad174c7708ff685ec27e280f9c0da  autofs-5.1.5.tar.xz
+
+# Hash for license files
+sha256 dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
+sha256 2ac2e352a92629e3abcdddbd3eeec64e7c2f5b58b6e819ff2c1444fb6e249fa3  COPYRIGHT
diff --git a/package/autofs/autofs.mk b/package/autofs/autofs.mk
index 5de399edf2..9b05a53113 100644
--- a/package/autofs/autofs.mk
+++ b/package/autofs/autofs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUTOFS_VERSION = 5.1.4
+AUTOFS_VERSION = 5.1.5
 AUTOFS_SOURCE = autofs-$(AUTOFS_VERSION).tar.xz
 AUTOFS_SITE = $(BR2_KERNEL_MIRROR)/linux/daemons/autofs/v5
 AUTOFS_LICENSE = GPL-2.0+
-- 
2.20.1
