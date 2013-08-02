From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Fri,  2 Aug 2013 10:57:31 +0200
Subject: [Buildroot] [PATCH 1/1] fix license typo
Message-ID: <1375433851-5791-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/cppcms/cppcms.mk |    2 +-
 package/libcec/libcec.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cppcms/cppcms.mk b/package/cppcms/cppcms.mk
index d2b1109..8d4a519 100644
--- a/package/cppcms/cppcms.mk
+++ b/package/cppcms/cppcms.mk
@@ -7,7 +7,7 @@
 CPPCMS_VERSION = 1.0.3
 CPPCMS_SOURCE = cppcms-$(CPPCMS_VERSION).tar.bz2
 CPPCMS_LICENSE = LGPLv3
-CPPCMS_LICENSE_FILE = COPYING.TXT
+CPPCMS_LICENSE_FILES = COPYING.TXT
 CPPCMS_SITE = http://downloads.sourceforge.net/project/cppcms/cppcms/$(CPPCMS_VERSION)
 CPPCMS_INSTALL_STAGING = YES
 
diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
index 49fa067..8a58e1e 100644
--- a/package/libcec/libcec.mk
+++ b/package/libcec/libcec.mk
@@ -7,7 +7,7 @@
 LIBCEC_VERSION = libcec-2.1.1
 LIBCEC_SITE = http://github.com/Pulse-Eight/libcec/tarball/$(LIBCEC_VERSION)
 LIBCEC_LICENSE = GPLv2+
-LIBCEC_LICENSE_FILE = COPYING
+LIBCEC_LICENSE_FILES = COPYING
 
 # Autoreconf required due to being a dev tarball and not a release tarball.
 LIBCEC_AUTORECONF = YES
-- 
1.7.9.5
