From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Aug 2016 11:46:43 +0200
Subject: [Buildroot] [git commit] pangomm: bump to version 2.40.1
Message-ID: <20160902142938.5E87F7FEE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5b3ea400a07a914c9a2f9f819f6052ca6dc3e53f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pangomm/pangomm.hash | 4 ++--
 package/pangomm/pangomm.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pangomm/pangomm.hash b/package/pangomm/pangomm.hash
index 4f39e51..b5d527f 100644
--- a/package/pangomm/pangomm.hash
+++ b/package/pangomm/pangomm.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/pangomm/2.40/pangomm-2.40.0.sha256sum
-sha256	7dd0afa9dcce57cdb0aad77da9ea46823ee8515d5f3ffd895b9ede7365c3d70d	pangomm-2.40.0.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/pangomm/2.40/pangomm-2.40.1.sha256sum
+sha256	9762ee2a2d5781be6797448d4dd2383ce14907159b30bc12bf6b08e7227be3af	pangomm-2.40.1.tar.xz
diff --git a/package/pangomm/pangomm.mk b/package/pangomm/pangomm.mk
index 2db7890..2a85e39 100644
--- a/package/pangomm/pangomm.mk
+++ b/package/pangomm/pangomm.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PANGOMM_VERSION_MAJOR = 2.40
-PANGOMM_VERSION = $(PANGOMM_VERSION_MAJOR).0
+PANGOMM_VERSION = $(PANGOMM_VERSION_MAJOR).1
 PANGOMM_SOURCE = pangomm-$(PANGOMM_VERSION).tar.xz
 PANGOMM_SITE = http://ftp.gnome.org/pub/gnome/sources/pangomm/$(PANGOMM_VERSION_MAJOR)
 PANGOMM_LICENSE = LGPLv2.1+ (library), GPLv2+ (tools)
