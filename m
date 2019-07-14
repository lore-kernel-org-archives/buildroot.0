From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Jul 2019 12:06:39 +0200
Subject: [Buildroot] [git commit] boot/barebox: bump version to 2019.07.0
Message-ID: <20190714102157.4469580163@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ce74d82517d096ce4d01e1a08c93ef4ede7c18cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/barebox/Config.in    | 4 ++--
 boot/barebox/barebox.hash | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index d919cacc57..f4c0c27df8 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -12,7 +12,7 @@ choice
 	  Select the specific Barebox version you want to use
 
 config BR2_TARGET_BAREBOX_LATEST_VERSION
-	bool "2019.05.0"
+	bool "2019.07.0"
 
 config BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	bool "Custom version"
@@ -40,7 +40,7 @@ endif
 
 config BR2_TARGET_BAREBOX_VERSION
 	string
-	default "2019.05.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
+	default "2019.07.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
 	default BR2_TARGET_BAREBOX_CUSTOM_VERSION_VALUE if BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	default BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
diff --git a/boot/barebox/barebox.hash b/boot/barebox/barebox.hash
index fb371ab671..70b500da77 100644
--- a/boot/barebox/barebox.hash
+++ b/boot/barebox/barebox.hash
@@ -1,5 +1,5 @@
-# From https://www.barebox.org/download/barebox-2019.05.0.tar.bz2.md5
-md5 2e721cce90f1ea1492710ca23680311f barebox-2019.05.0.tar.bz2
+# From https://www.barebox.org/download/barebox-2019.07.0.tar.bz2.md5
+md5 8fb8e8ec3775228c34f7de2096872f51 barebox-2019.07.0.tar.bz2
 
 # Locally calculated
-sha256 704bb09b2bf1347e43ebb9138da32a7e1b4d13892fd187be98f4f9dae000501d barebox-2019.05.0.tar.bz2
+sha256 8512ac1b91ef48f8b657fad446edc868eb7da30e93d6ff7854f0006854b6a3a6 barebox-2019.07.0.tar.bz2
