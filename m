From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 12 Apr 2013 10:05:13 +0200
Subject: [Buildroot] [git commit] linux: fix 3.8.x stable version
Message-ID: <20130412080455.E54DB9B5CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=13e2c9e7b0e9b02828a4d6d54ae3a40ef17046df
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit c461e64201598eae85ff32e130ed3f0ccd9fed78 bumped the linux 3.8.x
stable version from 3.8.5 to 3.8.6, but did so in only one of the two places
in which the version number is hard-coded in linux/Config.in

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 8208277..8d301a1 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -76,7 +76,7 @@ config BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "3.8.5" if BR2_LINUX_KERNEL_3_8
+	default "3.8.6" if BR2_LINUX_KERNEL_3_8
 	default BR2_DEFAULT_KERNEL_HEADERS if BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
