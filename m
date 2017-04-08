From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Apr 2017 21:43:40 +0200
Subject: [Buildroot] [git commit] package/znc: bump version to 1.6.5
Message-ID: <20170408194347.2E64F82160@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2f8d8908f2aab12144b274917beda710bc88fc92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/znc/znc.hash | 2 +-
 package/znc/znc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/znc/znc.hash b/package/znc/znc.hash
index 3682351..b242933 100644
--- a/package/znc/znc.hash
+++ b/package/znc/znc.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 431097eb17860bfc980f3e68fdd75f98af4bdeecd793c84835c6cb11c3320d1c  znc-1.6.4.tar.gz
+sha256 2f0225d49c53a01f8d94feea4619a6fe92857792bb3401a4eb1edd65f0342aca  znc-1.6.5.tar.gz
diff --git a/package/znc/znc.mk b/package/znc/znc.mk
index 5b96ee5..5783200 100644
--- a/package/znc/znc.mk
+++ b/package/znc/znc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZNC_VERSION = 1.6.4
+ZNC_VERSION = 1.6.5
 ZNC_SITE = http://znc.in/releases
 ZNC_LICENSE = Apache-2.0
 ZNC_LICENSE_FILES = LICENSE
