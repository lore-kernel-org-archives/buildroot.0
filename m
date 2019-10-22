From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Tue, 22 Oct 2019 19:35:11 +0200
Subject: [Buildroot] [PATCH 2/2] boot/at91bootstrap3: bump to version 3.9.0
In-Reply-To: <1571765711-31811-1-git-send-email-pjtexier@koncepto.io>
References: <1571765711-31811-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <1571765711-31811-2-git-send-email-pjtexier@koncepto.io>
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
index 89ef3fc..c3fc9d3 100644
--- a/boot/at91bootstrap3/Config.in
+++ b/boot/at91bootstrap3/Config.in
@@ -19,7 +19,7 @@ choice
 	prompt "AT91 Bootstrap 3 version"
 
 config BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION
-	bool "3.8.13"
+	bool "3.9.0"
 
 config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT
 	bool "Custom Git repository"
@@ -44,7 +44,7 @@ endif
 
 config BR2_TARGET_AT91BOOTSTRAP3_VERSION
 	string
-	default "v3.8.13" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION
+	default "v3.9.0" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION
 	default BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION \
 		if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT
 
diff --git a/boot/at91bootstrap3/at91bootstrap3.hash b/boot/at91bootstrap3/at91bootstrap3.hash
index ecfda3b..93f495f 100644
--- a/boot/at91bootstrap3/at91bootstrap3.hash
+++ b/boot/at91bootstrap3/at91bootstrap3.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	a5a10579598d47475696fab56c086225b0f4b710299e2dc9e0f9b6f72ed98be8  at91bootstrap3-v3.8.13.tar.gz
+sha256	9960b0d18fe42feee566d4c52efa0d7c8251685bf9acfdf343f30a27951ada1e  at91bootstrap3-v3.9.0.tar.gz
-- 
2.7.4
