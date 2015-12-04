From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Dec 2015 21:54:38 +0100
Subject: [Buildroot] [git commit] at91bootstrap3: bump to v3.8
Message-ID: <20151204205654.8D5F481D36@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6e6397fd766ea9d018ce52418b9a66881aafc573
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In preparation for sama5d2 xplained support, bump at91bootstrap3 to 3.8

[Peter: add .hash file]
Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/at91bootstrap3/Config.in           | 4 ++--
 boot/at91bootstrap3/at91bootstrap3.hash | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/boot/at91bootstrap3/Config.in b/boot/at91bootstrap3/Config.in
index 9f2f49b..b8ebe80 100644
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
 
diff --git a/boot/at91bootstrap3/at91bootstrap3.hash b/boot/at91bootstrap3/at91bootstrap3.hash
new file mode 100644
index 0000000..eee6482
--- /dev/null
+++ b/boot/at91bootstrap3/at91bootstrap3.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	ae7bb3f8e631f5216f05fd4650b37f2e76d88d0b893bd680f4f398f33b8f3470  at91bootstrap3-v3.8.tar.gz
