From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 21 Mar 2016 20:43:26 -0300
Subject: [Buildroot] [PATCH] vala: bump to version 0.32.0
Message-ID: <1458603806-19335-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/vala/vala.hash | 4 ++--
 package/vala/vala.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/vala/vala.hash b/package/vala/vala.hash
index 8b16838..9301964 100644
--- a/package/vala/vala.hash
+++ b/package/vala/vala.hash
@@ -1,2 +1,2 @@
-# From https://download.gnome.org/sources/vala/0.30/vala-0.30.1.sha256sum
-sha256	23add78e5c6a5e6df019d4a885c9c79814c9e0b957519ec8a4f4d826c4e5df2c	vala-0.30.1.tar.xz
+# From https://download.gnome.org/sources/vala/0.32/vala-0.32.0.sha256sum
+sha256	07a2aa4ede040789b4b5af817a42249d703bfe8affccb7732ca2b53d00c1fb6e	vala-0.32.0.tar.xz
diff --git a/package/vala/vala.mk b/package/vala/vala.mk
index 56d4db3..57a6956 100644
--- a/package/vala/vala.mk
+++ b/package/vala/vala.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-VALA_VERSION_MAJOR = 0.30
-VALA_VERSION = $(VALA_VERSION_MAJOR).1
+VALA_VERSION_MAJOR = 0.32
+VALA_VERSION = $(VALA_VERSION_MAJOR).0
 VALA_SITE = http://download.gnome.org/sources/vala/$(VALA_VERSION_MAJOR)
 VALA_SOURCE = vala-$(VALA_VERSION).tar.xz
 VALA_LICENSE = LGPLv2.1+
-- 
2.7.3
