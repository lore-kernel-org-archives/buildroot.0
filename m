From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  5 Aug 2020 14:57:59 +0200
Subject: [Buildroot] [PATCH] boot/at91bootstrap3: bump version to 3.9.3
Message-ID: <20200805125800.1279727-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/at91bootstrap3/Config.in           | 4 ++--
 boot/at91bootstrap3/at91bootstrap3.hash | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/boot/at91bootstrap3/Config.in b/boot/at91bootstrap3/Config.in
index 5492ace8fb..25ab30489f 100644
--- a/boot/at91bootstrap3/Config.in
+++ b/boot/at91bootstrap3/Config.in
@@ -19,7 +19,7 @@ choice
 	prompt "AT91 Bootstrap 3 version"
 
 config BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION
-	bool "3.9.2"
+	bool "3.9.3"
 
 config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT
 	bool "Custom Git repository"
@@ -51,7 +51,7 @@ endif
 
 config BR2_TARGET_AT91BOOTSTRAP3_VERSION
 	string
-	default "v3.9.2" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION
+	default "v3.9.3" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION
 	default BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION \
 		if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT
 	default "custom"	if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL
diff --git a/boot/at91bootstrap3/at91bootstrap3.hash b/boot/at91bootstrap3/at91bootstrap3.hash
index 5741b829f5..6671a4ac70 100644
--- a/boot/at91bootstrap3/at91bootstrap3.hash
+++ b/boot/at91bootstrap3/at91bootstrap3.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6cf37df482024f3770fe1880f768a675beda16323a90e702860d9e5478105b3f  at91bootstrap3-v3.9.2.tar.gz
+sha256  dd6a3c57c1c84fc3b18187bee3d139146a0e032dd1d8edea7b242730e0bc4fe1  at91bootstrap3-v3.9.3.tar.gz
 sha256  732b2a55b5905031d8ae420136ffb5f8889214865784386bf754cffab8d2bc6e  main.c
-- 
2.26.2
