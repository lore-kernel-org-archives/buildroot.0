From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Sep 2016 08:05:57 +0200
Subject: [Buildroot] [git commit] boot/at91bootstrap3: bump to version 3.8.6
Message-ID: <20160923060646.699F88226F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3409bcb5634bb498165db9f3fe35b58a5a868370
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Biagio Montaruli <biagio.hkr@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/at91bootstrap3/Config.in           | 4 ++--
 boot/at91bootstrap3/at91bootstrap3.hash | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

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
 
diff --git a/boot/at91bootstrap3/at91bootstrap3.hash b/boot/at91bootstrap3/at91bootstrap3.hash
index eee6482..e904a46 100644
--- a/boot/at91bootstrap3/at91bootstrap3.hash
+++ b/boot/at91bootstrap3/at91bootstrap3.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	ae7bb3f8e631f5216f05fd4650b37f2e76d88d0b893bd680f4f398f33b8f3470  at91bootstrap3-v3.8.tar.gz
+sha256	a2e9ec6f42ee3b5a805fe215257b63070b6c498d57c568c46fcb18fd1b38ea7e  at91bootstrap3-v3.8.6.tar.gz
