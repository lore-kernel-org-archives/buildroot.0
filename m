From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Mon,  3 Jun 2019 20:59:38 +0200
Subject: [Buildroot] [PATCH 1/1] boot/at91bootstrap3: bump to version 3.8.12
Message-ID: <1559588378-13429-1-git-send-email-pjtexier@koncepto.io>
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
index f6c310a..afdc7e7 100644
--- a/boot/at91bootstrap3/Config.in
+++ b/boot/at91bootstrap3/Config.in
@@ -19,7 +19,7 @@ choice
 	prompt "AT91 Bootstrap 3 version"
 
 config BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION
-	bool "3.8.6"
+	bool "3.8.12"
 
 config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT
 	bool "Custom Git repository"
@@ -44,7 +44,7 @@ endif
 
 config BR2_TARGET_AT91BOOTSTRAP3_VERSION
 	string
-	default "v3.8.6" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION
+	default "v3.8.12" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION
 	default BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION \
 		if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT
 
diff --git a/boot/at91bootstrap3/at91bootstrap3.hash b/boot/at91bootstrap3/at91bootstrap3.hash
index e904a46..cfeb9c8 100644
--- a/boot/at91bootstrap3/at91bootstrap3.hash
+++ b/boot/at91bootstrap3/at91bootstrap3.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	a2e9ec6f42ee3b5a805fe215257b63070b6c498d57c568c46fcb18fd1b38ea7e  at91bootstrap3-v3.8.6.tar.gz
+sha256	e25324b6f38725ad2ebfd946cb9e144f0d5889e2885992c7196a82b41fe45ee4  at91bootstrap3-v3.8.12.tar.gz
-- 
2.7.4
