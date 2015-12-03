From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Thu,  3 Dec 2015 23:31:58 +0100
Subject: [Buildroot] [PATCH] at91bootstrap3: bump to v3.8
Message-ID: <1449181918-15596-1-git-send-email-alexandre.belloni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In preparation for sama5d2 xplained support, bump at91bootstrap3 to 3.8

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 boot/at91bootstrap3/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/at91bootstrap3/Config.in b/boot/at91bootstrap3/Config.in
index 9f2f49bff1c5..b8ebe803dc29 100644
--- a/boot/at91bootstrap3/Config.in
+++ b/boot/at91bootstrap3/Config.in
@@ -15,7 +15,7 @@ choice
 	prompt "AT91 Bootstrap 3 version"
 
 config BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION
-	bool "3.7.2"
+	bool "3.8"
 
 config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT
 	bool "Custom Git repository"
@@ -40,7 +40,7 @@ endif
 
 config BR2_TARGET_AT91BOOTSTRAP3_VERSION
 	string
-	default "v3.7.2" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION
+	default "v3.8" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION
 	default BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION \
 		if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT
 
-- 
2.5.0
