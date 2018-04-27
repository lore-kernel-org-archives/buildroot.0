From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Apr 2018 18:25:01 +0200
Subject: [Buildroot] [git commit] package/znc: bump version to 1.6.6
Message-ID: <20180427163133.B70C388E76@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=621363f5ac15713697edd9f1c176814db599f28d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added license hash, switched _UPSTREAM to an upstream directory which
also contains older release tarballs.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/znc/znc.hash | 3 ++-
 package/znc/znc.mk   | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/znc/znc.hash b/package/znc/znc.hash
index b242933e9d..67c00ca217 100644
--- a/package/znc/znc.hash
+++ b/package/znc/znc.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 2f0225d49c53a01f8d94feea4619a6fe92857792bb3401a4eb1edd65f0342aca  znc-1.6.5.tar.gz
+sha256 7fb841bc71dc1749b1dc081e9eaf22ceb56ebb03c6b1d8804a4f9eb8bbd59525  znc-1.6.6.tar.gz
+sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/znc/znc.mk b/package/znc/znc.mk
index 5783200ef6..79db580da2 100644
--- a/package/znc/znc.mk
+++ b/package/znc/znc.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-ZNC_VERSION = 1.6.5
-ZNC_SITE = http://znc.in/releases
+ZNC_VERSION = 1.6.6
+ZNC_SITE = http://znc.in/releases/archive
 ZNC_LICENSE = Apache-2.0
 ZNC_LICENSE_FILES = LICENSE
 ZNC_DEPENDENCIES = host-pkgconf
