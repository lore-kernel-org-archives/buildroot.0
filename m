From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Thu, 28 May 2020 12:00:56 +0200
Subject: [Buildroot] [PATCH/next] boot/at91bootstrap3: bump to version 3.9.2
Message-ID: <1590660057-11642-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 boot/at91bootstrap3/Config.in           | 4 ++--
 boot/at91bootstrap3/at91bootstrap3.hash | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/boot/at91bootstrap3/Config.in b/boot/at91bootstrap3/Config.in
index faab763..ccbb531 100644
--- a/boot/at91bootstrap3/Config.in
+++ b/boot/at91bootstrap3/Config.in
@@ -19,7 +19,7 @@ choice
 	prompt "AT91 Bootstrap 3 version"
 
 config BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION
-	bool "3.9.0"
+	bool "3.9.2"
 
 config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT
 	bool "Custom Git repository"
@@ -51,7 +51,7 @@ endif
 
 config BR2_TARGET_AT91BOOTSTRAP3_VERSION
 	string
-	default "v3.9.0" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION
+	default "v3.9.2" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION
 	default BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION \
 		if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT
 	default "custom"	if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL
diff --git a/boot/at91bootstrap3/at91bootstrap3.hash b/boot/at91bootstrap3/at91bootstrap3.hash
index 9f6c95a..5741b82 100644
--- a/boot/at91bootstrap3/at91bootstrap3.hash
+++ b/boot/at91bootstrap3/at91bootstrap3.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	e23e6df23b79ca81e412cb73a1f48bd95df8d46c7d52a1d073c2ed9d4f3a1a71  at91bootstrap3-v3.9.0.tar.gz
+sha256  6cf37df482024f3770fe1880f768a675beda16323a90e702860d9e5478105b3f  at91bootstrap3-v3.9.2.tar.gz
 sha256  732b2a55b5905031d8ae420136ffb5f8889214865784386bf754cffab8d2bc6e  main.c
-- 
2.7.4
