From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 7 Dec 2015 10:58:43 +0000
Subject: [Buildroot] [PATCH 1/2] lighttpd: bump version to 1.4.38
Message-ID: <1449485924-10042-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/lighttpd/lighttpd.hash | 2 +-
 package/lighttpd/lighttpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lighttpd/lighttpd.hash b/package/lighttpd/lighttpd.hash
index b06e2ae..1158652 100644
--- a/package/lighttpd/lighttpd.hash
+++ b/package/lighttpd/lighttpd.hash
@@ -1,2 +1,2 @@
 # From http://www.lighttpd.net/
-sha256	804e6f60567ca1da2b3927f92b7e9332b93aca9560f282ca135b86b7558979bd	lighttpd-1.4.37.tar.xz
+sha256 4912568b7befcf3f552ca4668bd7f38cd85f42a22944359d00816ec27eb1e504  lighttpd-1.4.38.tar.xz
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 9ff8cfe..49b9ac6 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIGHTTPD_VERSION_MAJOR = 1.4
-LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).37
+LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).38
 LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
 LIGHTTPD_LICENSE = BSD-3c
-- 
2.4.10
