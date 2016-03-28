From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 28 Mar 2016 08:15:55 -0300
Subject: [Buildroot] [PATCH 2/2] pangomm: bump to version 2.40.0
In-Reply-To: <1459163755-16442-1-git-send-email-gustavo@zacarias.com.ar>
References: <1459163755-16442-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1459163755-16442-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/pangomm/pangomm.hash | 4 ++--
 package/pangomm/pangomm.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/pangomm/pangomm.hash b/package/pangomm/pangomm.hash
index f0f1486..4f39e51 100644
--- a/package/pangomm/pangomm.hash
+++ b/package/pangomm/pangomm.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/pangomm/2.38/pangomm-2.38.1.sha256sum
-sha256	effb18505b36d81fc32989a39ead8b7858940d0533107336a30bc3eef096bc8b	pangomm-2.38.1.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/pangomm/2.40/pangomm-2.40.0.sha256sum
+sha256	7dd0afa9dcce57cdb0aad77da9ea46823ee8515d5f3ffd895b9ede7365c3d70d	pangomm-2.40.0.tar.xz
diff --git a/package/pangomm/pangomm.mk b/package/pangomm/pangomm.mk
index 0d9b6f8..2db7890 100644
--- a/package/pangomm/pangomm.mk
+++ b/package/pangomm/pangomm.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PANGOMM_VERSION_MAJOR = 2.38
-PANGOMM_VERSION = $(PANGOMM_VERSION_MAJOR).1
+PANGOMM_VERSION_MAJOR = 2.40
+PANGOMM_VERSION = $(PANGOMM_VERSION_MAJOR).0
 PANGOMM_SOURCE = pangomm-$(PANGOMM_VERSION).tar.xz
 PANGOMM_SITE = http://ftp.gnome.org/pub/gnome/sources/pangomm/$(PANGOMM_VERSION_MAJOR)
 PANGOMM_LICENSE = LGPLv2.1+ (library), GPLv2+ (tools)
-- 
2.7.3
