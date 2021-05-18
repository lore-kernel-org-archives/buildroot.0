From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 May 2021 23:37:47 +0200
Subject: [Buildroot] [PATCH 2/3] boot/at91bootstrap3: bump 3.x series to
 3.10.2
In-Reply-To: <20210518213749.144355-1-thomas.petazzoni@bootlin.com>
References: <20210518213749.144355-1-thomas.petazzoni@bootlin.com>
Message-ID: <20210518213749.144355-3-thomas.petazzoni@bootlin.com>
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
index a63eb1d623..6af997b8eb 100644
--- a/boot/at91bootstrap3/at91bootstrap3.hash
+++ b/boot/at91bootstrap3/at91bootstrap3.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  dd6a3c57c1c84fc3b18187bee3d139146a0e032dd1d8edea7b242730e0bc4fe1  at91bootstrap3-v3.9.3.tar.gz
+sha256  33e4ba431af93a4fc2e81c1458cd31901b9f69c583ebe4c74ca78c0846479bfd  at91bootstrap3-v3.10.2.tar.gz
 sha256  b5d5f042297cad0d091f7d8734e61eb9ec7b6020898e086503fb5f8bc71fb9fc  at91bootstrap3-v4.0.0-rc2.tar.gz
 sha256  fd7a1ce5719bb7abf5e289da2e0ea8c933af3ba0f6ad03dbdbd2b7f54a77498a  main.c
-- 
2.31.1
