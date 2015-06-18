From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 18 Jun 2015 18:44:27 +0200
Subject: [Buildroot] [PATCH 04/10] lvm2: bump to version 2.02.121
In-Reply-To: <1434645873-26849-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1434645873-26849-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1434645873-26849-4-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Bump to version 2.02.121
- Update hash file

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/lvm2/lvm2.hash | 2 +-
 package/lvm2/lvm2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lvm2/lvm2.hash b/package/lvm2/lvm2.hash
index e7f7b2d..6137108 100644
--- a/package/lvm2/lvm2.hash
+++ b/package/lvm2/lvm2.hash
@@ -1,2 +1,2 @@
 # From ftp://sources.redhat.com/pub/lvm2/md5.sum
-md5  ab5889dae7924b44ed2444161058a419  LVM2.2.02.117.tgz
+md5  702c61bf07a8fc6dc0db6e9d323d9f6d  LVM2.2.02.121.tgz
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 6e324eb..a2db504 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LVM2_VERSION = 2.02.117
+LVM2_VERSION = 2.02.121
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE = ftp://sources.redhat.com/pub/lvm2/releases
 LVM2_INSTALL_STAGING = YES
-- 
2.3.6
