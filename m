From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jun 2016 09:44:33 +0200
Subject: [Buildroot] [git commit] exfat-utils: bump to version 1.2.4
Message-ID: <20160615074639.DE4117F9FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3b2dd72dbeed08757a4e2081615270168884071e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/exfat-utils/exfat-utils.hash | 2 +-
 package/exfat-utils/exfat-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/exfat-utils/exfat-utils.hash b/package/exfat-utils/exfat-utils.hash
index 7bcaa33..b40e632 100644
--- a/package/exfat-utils/exfat-utils.hash
+++ b/package/exfat-utils/exfat-utils.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	80d3b3f21242d60d36a38a4ddb05cb7cc3a7d4eef5793e8314814937b938fcea	exfat-utils-1.2.3.tar.gz
+sha256	6aa51926416b9d0977b456902f4c4cd10bcce4b2d160859a7a2fc9ca6bcbbb11	exfat-utils-1.2.4.tar.gz
diff --git a/package/exfat-utils/exfat-utils.mk b/package/exfat-utils/exfat-utils.mk
index e6359bc..259c2da 100644
--- a/package/exfat-utils/exfat-utils.mk
+++ b/package/exfat-utils/exfat-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXFAT_UTILS_VERSION = 1.2.3
+EXFAT_UTILS_VERSION = 1.2.4
 EXFAT_UTILS_SITE = https://github.com/relan/exfat/releases/download/v$(EXFAT_UTILS_VERSION)
 EXFAT_UTILS_LICENSE = GPLv3+
 EXFAT_UTILS_LICENSE_FILES = COPYING
