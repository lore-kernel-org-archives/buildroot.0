From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 7 Dec 2015 10:58:44 +0000
Subject: [Buildroot] [PATCH 2/2] lvm2: bump version to 2.02.137
In-Reply-To: <1449485924-10042-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1449485924-10042-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1449485924-10042-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/lvm2/lvm2.hash | 2 +-
 package/lvm2/lvm2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lvm2/lvm2.hash b/package/lvm2/lvm2.hash
index 99c576e..539bf49 100644
--- a/package/lvm2/lvm2.hash
+++ b/package/lvm2/lvm2.hash
@@ -1,2 +1,2 @@
 # From ftp://sources.redhat.com/pub/lvm2/releases/sha512.sum
-sha512 ebda683e7dbeb2c4860a583d47e60756d18127e37a373ab2958af8e54b9bee0d2e3370b7803d88fa4b08564345c88af55bfbac317081160118ce4b3733b69f9d  LVM2.2.02.136.tgz
+sha512 d042bad51eacc350e3a2b08a631498d7bdff29032804e7db4c6a0723e8896628b89e6395a311535c09429429c17adfeb45794d5f53bdeb5d51b195114fca309a  LVM2.2.02.137.tgz
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 71e69d6..59206cc 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LVM2_VERSION = 2.02.136
+LVM2_VERSION = 2.02.137
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE = ftp://sources.redhat.com/pub/lvm2/releases
 LVM2_INSTALL_STAGING = YES
-- 
2.4.10
