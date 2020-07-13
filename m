From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 13 Jul 2020 18:38:30 +0200
Subject: [Buildroot] [PATCH 2/2] package/libmatroska: bump to version 1.6.0
In-Reply-To: <20200713163830.1452178-1-fontaine.fabrice@gmail.com>
References: <20200713163830.1452178-1-fontaine.fabrice@gmail.com>
Message-ID: <20200713163830.1452178-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmatroska/libmatroska.hash | 4 ++--
 package/libmatroska/libmatroska.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libmatroska/libmatroska.hash b/package/libmatroska/libmatroska.hash
index 827f08921c..0ef5278e76 100644
--- a/package/libmatroska/libmatroska.hash
+++ b/package/libmatroska/libmatroska.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	0ac6debfbf781d47f001b830aaf9be9dfbcefd13bcfb80ca5efc1c04b4a3c962	libmatroska-1.5.2.tar.xz
-sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	LICENSE.LGPL
+sha256  fec89cebd500807f7fd14b56c14733f11045fa2a21398ff6f6c5c0e3e01b4033  libmatroska-1.6.0.tar.xz
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL
diff --git a/package/libmatroska/libmatroska.mk b/package/libmatroska/libmatroska.mk
index 7b7c5f03ef..58f033ad8e 100644
--- a/package/libmatroska/libmatroska.mk
+++ b/package/libmatroska/libmatroska.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMATROSKA_VERSION = 1.5.2
+LIBMATROSKA_VERSION = 1.6.0
 LIBMATROSKA_SOURCE = libmatroska-$(LIBMATROSKA_VERSION).tar.xz
 LIBMATROSKA_SITE = http://dl.matroska.org/downloads/libmatroska
 LIBMATROSKA_INSTALL_STAGING = YES
-- 
2.27.0
