From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 May 2021 11:20:51 +0200
Subject: [Buildroot] [git commit branch/next] boot/at91bootstrap3: bump 3.x
 series to 3.10.2
Message-ID: <20210519085539.57737814F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7abfdeea120825e9818b96457b5e3c595f00c0d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 boot/at91bootstrap3/Config.in           | 4 ++--
 boot/at91bootstrap3/at91bootstrap3.hash | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/boot/at91bootstrap3/Config.in b/boot/at91bootstrap3/Config.in
index ebc912e46c..18301a0dc0 100644
--- a/boot/at91bootstrap3/Config.in
+++ b/boot/at91bootstrap3/Config.in
@@ -22,7 +22,7 @@ config BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION
 	bool "4.0.0-rc2"
 
 config BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X
-	bool "3.9.3"
+	bool "3.10.2"
 
 config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT
 	bool "Custom Git repository"
@@ -55,7 +55,7 @@ endif
 config BR2_TARGET_AT91BOOTSTRAP3_VERSION
 	string
 	default "v4.0.0-rc2" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION
-	default "v3.9.3" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X
+	default "v3.10.2" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X
 	default BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION \
 		if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT
 	default "custom"	if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL
diff --git a/boot/at91bootstrap3/at91bootstrap3.hash b/boot/at91bootstrap3/at91bootstrap3.hash
index e4d402ee47..8b7453bbd4 100644
--- a/boot/at91bootstrap3/at91bootstrap3.hash
+++ b/boot/at91bootstrap3/at91bootstrap3.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  dd6a3c57c1c84fc3b18187bee3d139146a0e032dd1d8edea7b242730e0bc4fe1  at91bootstrap3-v3.9.3.tar.gz
+sha256  33e4ba431af93a4fc2e81c1458cd31901b9f69c583ebe4c74ca78c0846479bfd  at91bootstrap3-v3.10.2.tar.gz
 sha256  b5d5f042297cad0d091f7d8734e61eb9ec7b6020898e086503fb5f8bc71fb9fc  at91bootstrap3-v4.0.0-rc2.tar.gz
