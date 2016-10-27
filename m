From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 27 Oct 2016 06:53:53 -0300
Subject: [Buildroot] [PATCH] vala: bump to version 0.34.2
Message-ID: <1477562033-21157-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/vala/vala.hash | 4 ++--
 package/vala/vala.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/vala/vala.hash b/package/vala/vala.hash
index 78367d0..95566d1 100644
--- a/package/vala/vala.hash
+++ b/package/vala/vala.hash
@@ -1,2 +1,2 @@
-# From https://download.gnome.org/sources/vala/0.34/vala-0.34.1.sha256sum
-sha256	f5ccfcfc460a0c6797bfbd7e739042bf5988a0f44d82278dbe1880c0e5f29299	vala-0.34.1.tar.xz
+# From https://download.gnome.org/sources/vala/0.34/vala-0.34.2.sha256sum
+sha256	765e9c2b429a66db93247940f8588319b43f35c173d057bcae5717a97d765c41	vala-0.34.2.tar.xz
diff --git a/package/vala/vala.mk b/package/vala/vala.mk
index 3333cf4..a208bdc 100644
--- a/package/vala/vala.mk
+++ b/package/vala/vala.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 VALA_VERSION_MAJOR = 0.34
-VALA_VERSION = $(VALA_VERSION_MAJOR).1
+VALA_VERSION = $(VALA_VERSION_MAJOR).2
 VALA_SITE = http://download.gnome.org/sources/vala/$(VALA_VERSION_MAJOR)
 VALA_SOURCE = vala-$(VALA_VERSION).tar.xz
 VALA_LICENSE = LGPLv2.1+
-- 
2.7.3
