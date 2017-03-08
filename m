From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  8 Mar 2017 10:09:38 -0300
Subject: [Buildroot] [PATCH] vala: bump to version 0.34.6
Message-ID: <20170308130938.12559-1-gustavo@zacarias.com.ar>
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
index 36cc3ab..390eb44 100644
--- a/package/vala/vala.hash
+++ b/package/vala/vala.hash
@@ -1,2 +1,2 @@
-# From https://download.gnome.org/sources/vala/0.34/vala-0.34.5.sha256sum
-sha256 3fd4ba371778bc87da42827b8d23f1f42b0629759a9a1c40c9683dfb7e73fae5  vala-0.34.5.tar.xz
+# From https://download.gnome.org/sources/vala/0.34/vala-0.34.6.sha256sum
+sha256 d1e32d6c55c2d66964d30b7410b78f5f313f1231fc3502da9980c3c80a797bb1  vala-0.34.6.tar.xz
diff --git a/package/vala/vala.mk b/package/vala/vala.mk
index f3a4de4..c59ba25 100644
--- a/package/vala/vala.mk
+++ b/package/vala/vala.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 VALA_VERSION_MAJOR = 0.34
-VALA_VERSION = $(VALA_VERSION_MAJOR).5
+VALA_VERSION = $(VALA_VERSION_MAJOR).6
 VALA_SITE = http://download.gnome.org/sources/vala/$(VALA_VERSION_MAJOR)
 VALA_SOURCE = vala-$(VALA_VERSION).tar.xz
 VALA_LICENSE = LGPLv2.1+
-- 
2.10.2
