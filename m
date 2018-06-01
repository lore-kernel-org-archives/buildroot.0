From: Baruch Siach <baruch@tkos.co.il>
Date: Fri,  1 Jun 2018 11:06:44 +0300
Subject: [Buildroot] [PATCH next] sysstat: bump to version 11.6.3
Message-ID: <c3a5c093b77c6661dc5de16fc4756b691a4212a7.1527840404.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/sysstat/sysstat.hash | 4 ++--
 package/sysstat/sysstat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sysstat/sysstat.hash b/package/sysstat/sysstat.hash
index a35631076a5e..3bbefac1892c 100644
--- a/package/sysstat/sysstat.hash
+++ b/package/sysstat/sysstat.hash
@@ -1,5 +1,5 @@
 # From: http://sebastien.godard.pagesperso-orange.fr/download.html
-sha1 2eb3d20016084c9e6ff94c9b2f3b2ada7e8d26c6  sysstat-11.6.1.tar.xz
+sha1 5300345489e455ac62547b072bb8531414758fdf  sysstat-11.6.3.tar.xz
 # Locally calculated
-sha256 4b2a2cfa8c8fe6ae0155e168ed9a7066caebc3ecb903b0e64a9ede28ecb68fcb  sysstat-11.6.1.tar.xz
+sha256 54b306a1634e39710767936d4d1be17e8b65062aa04c837b41479c4b28b511bd  sysstat-11.6.3.tar.xz
 sha256 db296f2f7f35bca3a174efb0eb392b3b17bd94b341851429a3dff411b1c2fc73  COPYING
diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index bdc0610ea3a6..490e8f1b2871 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSSTAT_VERSION = 11.6.1
+SYSSTAT_VERSION = 11.6.3
 SYSSTAT_SOURCE = sysstat-$(SYSSTAT_VERSION).tar.xz
 SYSSTAT_SITE = http://pagesperso-orange.fr/sebastien.godard
 SYSSTAT_CONF_OPTS = --disable-file-attr --disable-sensors
-- 
2.17.0
