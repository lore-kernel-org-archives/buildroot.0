From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  2 Mar 2017 16:17:18 -0300
Subject: [Buildroot] [PATCH] vala: bump to version 0.34.5
Message-ID: <20170302191718.1364-1-gustavo@zacarias.com.ar>
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
index ca5873c..36cc3ab 100644
--- a/package/vala/vala.hash
+++ b/package/vala/vala.hash
@@ -1,2 +1,2 @@
-# From https://download.gnome.org/sources/vala/0.34/vala-0.34.4.sha256sum
-sha256 6b17bd339414563ebc51f64b0b837919ea7552d8a8ffa71cdc837d25c9696b83  vala-0.34.4.tar.xz
+# From https://download.gnome.org/sources/vala/0.34/vala-0.34.5.sha256sum
+sha256 3fd4ba371778bc87da42827b8d23f1f42b0629759a9a1c40c9683dfb7e73fae5  vala-0.34.5.tar.xz
diff --git a/package/vala/vala.mk b/package/vala/vala.mk
index dadfdfc..f3a4de4 100644
--- a/package/vala/vala.mk
+++ b/package/vala/vala.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 VALA_VERSION_MAJOR = 0.34
-VALA_VERSION = $(VALA_VERSION_MAJOR).4
+VALA_VERSION = $(VALA_VERSION_MAJOR).5
 VALA_SITE = http://download.gnome.org/sources/vala/$(VALA_VERSION_MAJOR)
 VALA_SOURCE = vala-$(VALA_VERSION).tar.xz
 VALA_LICENSE = LGPLv2.1+
-- 
2.10.2
