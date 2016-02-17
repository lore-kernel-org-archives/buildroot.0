From: Gabe Evans <gabe@hashrabbit.co>
Date: Wed, 17 Feb 2016 18:52:47 +0000
Subject: [Buildroot] [PATCH 1/1] package/systemd: bump version to 229
Message-ID: <1455735167-19497-1-git-send-email-gabe@hashrabbit.co>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
---
 package/systemd/systemd.hash | 2 +-
 package/systemd/systemd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index 8090200..7295986 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,2 +1,2 @@
 # sha256 locally computed
-sha256 dd124ff561a07e6439ed2b3713f38ca914df7747f110ce86deea17b56d245ae6  systemd-228.tar.gz
+sha256 b51b0a48d1beb388d95bd6a98d62be05490335d4bb388aefecdcb576e91e0741  systemd-229.tar.gz
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 05121cf..6705333 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSTEMD_VERSION = 228
+SYSTEMD_VERSION = 229
 SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = LGPLv2.1+, GPLv2+ (udev), Public Domain (few source files, see README)
 SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README
-- 
1.9.1
