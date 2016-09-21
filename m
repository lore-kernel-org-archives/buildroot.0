From: Biagio Montaruli <biagio.hkr@gmail.com>
Date: Wed, 21 Sep 2016 11:37:19 +0200
Subject: [Buildroot] [PATCH 1/3] Update at91bootstrap3 package to 3.8.6
	version
Message-ID: <1474450641-7816-1-git-send-email-biagio.hkr@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Biagio Montaruli <biagio.hkr@gmail.com>
---
 boot/at91bootstrap3/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/at91bootstrap3/Config.in b/boot/at91bootstrap3/Config.in
index b8ebe80..237deb9 100644
--- a/boot/at91bootstrap3/Config.in
+++ b/boot/at91bootstrap3/Config.in
@@ -15,7 +15,7 @@ choice
 	prompt "AT91 Bootstrap 3 version"
 
 config BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION
-	bool "3.8"
+	bool "3.8.6"
 
 config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT
 	bool "Custom Git repository"
@@ -40,7 +40,7 @@ endif
 
 config BR2_TARGET_AT91BOOTSTRAP3_VERSION
 	string
-	default "v3.8" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION
+	default "v3.8.6" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION
 	default BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION \
 		if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT
 
-- 
2.7.4
