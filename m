From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Thu, 11 Jul 2019 22:13:30 +0200
Subject: [Buildroot] [PATCH 1/1] boot/at91bootstrap3: bump to version 3.8.13
Message-ID: <1562876010-29364-1-git-send-email-pjtexier@koncepto.io>
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
index afdc7e7..89ef3fc 100644
--- a/boot/at91bootstrap3/Config.in
+++ b/boot/at91bootstrap3/Config.in
@@ -19,7 +19,7 @@ choice
 	prompt "AT91 Bootstrap 3 version"
 
 config BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION
-	bool "3.8.12"
+	bool "3.8.13"
 
 config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT
 	bool "Custom Git repository"
@@ -44,7 +44,7 @@ endif
 
 config BR2_TARGET_AT91BOOTSTRAP3_VERSION
 	string
-	default "v3.8.12" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION
+	default "v3.8.13" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION
 	default BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION \
 		if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT
 
diff --git a/boot/at91bootstrap3/at91bootstrap3.hash b/boot/at91bootstrap3/at91bootstrap3.hash
index cfeb9c8..ecfda3b 100644
--- a/boot/at91bootstrap3/at91bootstrap3.hash
+++ b/boot/at91bootstrap3/at91bootstrap3.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	e25324b6f38725ad2ebfd946cb9e144f0d5889e2885992c7196a82b41fe45ee4  at91bootstrap3-v3.8.12.tar.gz
+sha256	a5a10579598d47475696fab56c086225b0f4b710299e2dc9e0f9b6f72ed98be8  at91bootstrap3-v3.8.13.tar.gz
-- 
2.7.4
