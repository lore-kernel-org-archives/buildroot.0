From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 16 Jan 2017 13:34:26 +0000
Subject: [Buildroot] [PATCH] sysstat: bump version to 11.4.3
Message-ID: <20170116133426.21244-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/sysstat/sysstat.hash | 4 ++--
 package/sysstat/sysstat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sysstat/sysstat.hash b/package/sysstat/sysstat.hash
index 5de5ec7..3b4dda8 100644
--- a/package/sysstat/sysstat.hash
+++ b/package/sysstat/sysstat.hash
@@ -1,4 +1,4 @@
 # From: http://sebastien.godard.pagesperso-orange.fr/download.html
-sha1	84ac7feba76049f201e203c7ce0cc750479a9d43	sysstat-11.4.2.tar.xz
+sha1 805002b2bef00cd9ab44c5037d09b29cb71a17f8  sysstat-11.4.3.tar.xz
 # Locally calculated
-sha256	1fd407f8971f5854bc853d931dd85bcbea08658130f3f8510a730d5561980f39  sysstat-11.4.2.tar.xz
+sha256 02e9cafa5557fbae435d33e592373655df929d817ae711d31142dd2f7d4dcee7  sysstat-11.4.3.tar.xz
diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index 1a86fa0..c285342 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSSTAT_VERSION = 11.4.2
+SYSSTAT_VERSION = 11.4.3
 SYSSTAT_SOURCE = sysstat-$(SYSSTAT_VERSION).tar.xz
 SYSSTAT_SITE = http://pagesperso-orange.fr/sebastien.godard
 SYSSTAT_CONF_OPTS = --disable-man-group --disable-sensors
-- 
2.10.2
