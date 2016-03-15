From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Mar 2016 23:04:58 +0100
Subject: [Buildroot] [git commit] pangomm: roll back to version 2.38.1
Message-ID: <20160315220517.DCECB81767@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4cdc1a01f4bc9a1d8b58ef75eeb33b1187b6256b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

2.39.1 (and all odd-numbered versions for y in x.y.z) are development
releases not intended for general usage, so roll back to the latest
stable version.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pangomm/pangomm.hash | 4 ++--
 package/pangomm/pangomm.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pangomm/pangomm.hash b/package/pangomm/pangomm.hash
index 39e6a91..f0f1486 100644
--- a/package/pangomm/pangomm.hash
+++ b/package/pangomm/pangomm.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/pangomm/2.39/pangomm-2.39.1.sha256sum
-sha256	10c06bbf12a03963ffe9c697887b57c72f1dac1671d09dba45cecd25db5dc6ed	pangomm-2.39.1.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/pangomm/2.38/pangomm-2.38.1.sha256sum
+sha256	effb18505b36d81fc32989a39ead8b7858940d0533107336a30bc3eef096bc8b	pangomm-2.38.1.tar.xz
diff --git a/package/pangomm/pangomm.mk b/package/pangomm/pangomm.mk
index 42aa99e..0d9b6f8 100644
--- a/package/pangomm/pangomm.mk
+++ b/package/pangomm/pangomm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PANGOMM_VERSION_MAJOR = 2.39
+PANGOMM_VERSION_MAJOR = 2.38
 PANGOMM_VERSION = $(PANGOMM_VERSION_MAJOR).1
 PANGOMM_SOURCE = pangomm-$(PANGOMM_VERSION).tar.xz
 PANGOMM_SITE = http://ftp.gnome.org/pub/gnome/sources/pangomm/$(PANGOMM_VERSION_MAJOR)
