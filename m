From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 1 Jul 2015 13:39:35 +0200
Subject: [Buildroot] [PATCH 2/3] lvm2: bump to version 2.02.123
In-Reply-To: <1435750776-3364-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1435750776-3364-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1435750776-3364-2-git-send-email-Vincent.Riera@imgtec.com>
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
index 6137108..e6047bb 100644
--- a/package/lvm2/lvm2.hash
+++ b/package/lvm2/lvm2.hash
@@ -1,2 +1,2 @@
 # From ftp://sources.redhat.com/pub/lvm2/md5.sum
-md5  702c61bf07a8fc6dc0db6e9d323d9f6d  LVM2.2.02.121.tgz
+md5  5ae469f1a021729d3db9d269077ad4fe  LVM2.2.02.123.tgz
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index a2db504..bae0d54 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LVM2_VERSION = 2.02.121
+LVM2_VERSION = 2.02.123
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE = ftp://sources.redhat.com/pub/lvm2/releases
 LVM2_INSTALL_STAGING = YES
-- 
2.3.6
