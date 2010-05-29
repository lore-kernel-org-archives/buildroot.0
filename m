From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 29 May 2010 20:09:25 +0200
Subject: [Buildroot] [git commit master] ncftp: bump version
Message-ID: <20100529180949.C1A0C12E133@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=bc065596b4dd69fa36e2f8319b63fc4cd9e18529
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Due to recent 3.2.4 release, 3.2.2 download address has changed, so
I prefered bump version to 3.2.4 rather than changing NCFTP_SITE.

Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                |    3 ++-
 package/ncftp/ncftp.mk |    2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 038c675..5f65824 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,7 +2,8 @@
 
 	Fixes all over the tree.
 
-	Updated/fixed packages: coreutils, hal, libcap, xserver_xorg-server
+	Updated/fixed packages: coreutils, hal, libcap, ncftp,
+	xserver_xorg-server
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/ncftp/ncftp.mk b/package/ncftp/ncftp.mk
index 84bfee1..757cc6e 100644
--- a/package/ncftp/ncftp.mk
+++ b/package/ncftp/ncftp.mk
@@ -3,7 +3,7 @@
 # ncftp client
 #
 #############################################################
-NCFTP_VERSION:=3.2.2
+NCFTP_VERSION:=3.2.4
 NCFTP_SOURCE:=ncftp-$(NCFTP_VERSION)-src.tar.bz2
 NCFTP_SITE:=ftp://ftp.ncftp.com/ncftp
 
-- 
1.6.3.3
