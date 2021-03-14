From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 14 Mar 2021 19:00:27 +0100
Subject: [Buildroot] [PATCH 1/1] package/libmatroska: bump to version 1.6.3
Message-ID: <20210314180027.848846-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://github.com/Matroska-Org/libmatroska/blob/release-1.6.3/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmatroska/libmatroska.hash | 2 +-
 package/libmatroska/libmatroska.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmatroska/libmatroska.hash b/package/libmatroska/libmatroska.hash
index 4c3d754f8f..81b418d030 100644
--- a/package/libmatroska/libmatroska.hash
+++ b/package/libmatroska/libmatroska.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  bc4479aa8422ab07643df6a1fa5a19e4bed4badfd41ca77e081628620d1e1990  libmatroska-1.6.2.tar.xz
+sha256  daf91a63f58dd157ca340c457871e66260cb9c3333fefb008b318befbb0e081a  libmatroska-1.6.3.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL
diff --git a/package/libmatroska/libmatroska.mk b/package/libmatroska/libmatroska.mk
index 91727ae973..7d326c0076 100644
--- a/package/libmatroska/libmatroska.mk
+++ b/package/libmatroska/libmatroska.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMATROSKA_VERSION = 1.6.2
+LIBMATROSKA_VERSION = 1.6.3
 LIBMATROSKA_SOURCE = libmatroska-$(LIBMATROSKA_VERSION).tar.xz
 LIBMATROSKA_SITE = http://dl.matroska.org/downloads/libmatroska
 LIBMATROSKA_INSTALL_STAGING = YES
-- 
2.30.0
