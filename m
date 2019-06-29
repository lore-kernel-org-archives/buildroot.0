From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 29 Jun 2019 16:46:30 +0200
Subject: [Buildroot] [PATCH 5/5] package/p11-kit: bump version to 0.23.16.1
In-Reply-To: <20190629144630.8036-1-bernd.kuhls@t-online.de>
References: <20190629144630.8036-1-bernd.kuhls@t-online.de>
Message-ID: <20190629144630.8036-5-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added license hash, switched _SITE to github, previous URL is broken.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/p11-kit/p11-kit.hash | 4 +++-
 package/p11-kit/p11-kit.mk   | 4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/p11-kit/p11-kit.hash b/package/p11-kit/p11-kit.hash
index c0182eb4ce..45f0f1d64e 100644
--- a/package/p11-kit/p11-kit.hash
+++ b/package/p11-kit/p11-kit.hash
@@ -1,2 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256	ba726ea8303c97467a33fca50ee79b7b35212964be808ecf9b145e9042fdfaf0	p11-kit-0.23.2.tar.gz
+sha256 4b34e92ae36fa493e0d94366c767f06d5f9951e3d8581d10fd935d738db1574d  p11-kit-0.23.16.1.tar.gz
+# Locally computed
+sha256 2e1ba993904df807a10c3eda1e5c272338edc35674b679773a8b3ad460731054  COPYING
diff --git a/package/p11-kit/p11-kit.mk b/package/p11-kit/p11-kit.mk
index 10b5cc0393..1f72e0515b 100644
--- a/package/p11-kit/p11-kit.mk
+++ b/package/p11-kit/p11-kit.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-P11_KIT_VERSION = 0.23.2
-P11_KIT_SITE = http://p11-glue.freedesktop.org/releases
+P11_KIT_VERSION = 0.23.16.1
+P11_KIT_SITE = https://github.com/p11-glue/p11-kit/releases/download/$(P11_KIT_VERSION)
 P11_KIT_DEPENDENCIES = host-pkgconf libffi libtasn1
 P11_KIT_INSTALL_STAGING = YES
 P11_KIT_CONF_OPTS = --disable-static
-- 
2.20.1
