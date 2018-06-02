From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 2 Jun 2018 12:43:38 +0200
Subject: [Buildroot] [git commit] sysstat: bump to version 11.6.3
Message-ID: <20180602104305.1094F83463@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2e0e7b90fc2d33f102b68e156a63c7abb325a9e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sysstat/sysstat.hash | 4 ++--
 package/sysstat/sysstat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sysstat/sysstat.hash b/package/sysstat/sysstat.hash
index a35631076a..3bbefac189 100644
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
index bdc0610ea3..490e8f1b28 100644
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
