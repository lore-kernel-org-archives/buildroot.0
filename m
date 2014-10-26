From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 26 Oct 2014 19:45:34 +0100
Subject: [Buildroot] [PATCH 28/51] smcroute: bump version
In-Reply-To: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1414349157-22749-28-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a hash file also since the release tarball has been uploaded by the
maintainer.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/smcroute/smcroute.hash | 4 ++++
 package/smcroute/smcroute.mk   | 5 +++--
 2 files changed, 7 insertions(+), 2 deletions(-)
 create mode 100644 package/smcroute/smcroute.hash

diff --git a/package/smcroute/smcroute.hash b/package/smcroute/smcroute.hash
new file mode 100644
index 0000000..b24228f
--- /dev/null
+++ b/package/smcroute/smcroute.hash
@@ -0,0 +1,4 @@
+# Locally generated
+sha256  66fd32dc66b5d32670918205a94c4f2ac8c56741486326922e4d1a92f628db48  smcroute-2.0.0.tar.xz
+# From https://github.com/troglobit/smcroute/releases/download/2.0.0/smcroute-2.0.0.tar.xz.md5
+md5     cbf478e52ab9ae411adca41b9d22f68a  smcroute-2.0.0.tar.xz
diff --git a/package/smcroute/smcroute.mk b/package/smcroute/smcroute.mk
index 59c4fef..9de65f8 100755
--- a/package/smcroute/smcroute.mk
+++ b/package/smcroute/smcroute.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-SMCROUTE_VERSION = 1.99.2
-SMCROUTE_SITE = $(call github,troglobit,smcroute,$(SMCROUTE_VERSION))
+SMCROUTE_VERSION = 2.0.0
+SMCROUTE_SOURCE = smcroute-$(SMCROUTE_VERSION).tar.xz
+SMCROUTE_SITE = https://github.com/troglobit/smcroute/releases/download/$(SMCROUTE_VERSION)/
 SMCROUTE_LICENSE = GPLv2+
 SMCROUTE_LICENSE_FILES = COPYING
 
-- 
2.1.1
