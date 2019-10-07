From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Oct 2019 23:10:40 +0200
Subject: [Buildroot] [git commit] package/liberation: bump version to 2.00.5
Message-ID: <20191007210751.3D87D82DD1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=25dba7163c4320398b4319e10e1f878d40d0e3b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switched upstream to github according to
https://release-monitoring.org/project/16833/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/liberation/liberation.hash | 2 +-
 package/liberation/liberation.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/liberation/liberation.hash b/package/liberation/liberation.hash
index 5ae4034dea..a15dc23511 100644
--- a/package/liberation/liberation.hash
+++ b/package/liberation/liberation.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	7890278a6cd17873c57d9cd785c2d230d9abdea837e96516019c5885dd271504	liberation-fonts-ttf-2.00.1.tar.gz
+sha256	f14ff0a0be87b5aeb672e669363b5a699db76feb1144b06798261c0fdcd2b24d	liberation-fonts-ttf-2.00.5.tar.gz
 sha256	93fed46019c38bbe566b479d22148e2e8a1e85ada614accb0211c37b2c61c19b	LICENSE
diff --git a/package/liberation/liberation.mk b/package/liberation/liberation.mk
index cabee17202..495a1ffa63 100644
--- a/package/liberation/liberation.mk
+++ b/package/liberation/liberation.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBERATION_VERSION = 2.00.1
-LIBERATION_SITE = https://releases.pagure.org/liberation-fonts
+LIBERATION_VERSION = 2.00.5
+LIBERATION_SITE = https://github.com/liberationfonts/liberation-fonts/files/2926169
 LIBERATION_SOURCE = liberation-fonts-ttf-$(LIBERATION_VERSION).tar.gz
 LIBERATION_TARGET_DIR = $(TARGET_DIR)/usr/share/fonts/liberation
 LIBERATION_LICENSE = OFL-1.1
