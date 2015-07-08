From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 Jul 2015 23:47:35 +0200
Subject: [Buildroot] [git commit] lvm2: bump to version 2.02.125
Message-ID: <20150708214801.74364818B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f64f18938877a8b4cdbbf22874ce2da9917e69e6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lvm2/lvm2.hash |    2 +-
 package/lvm2/lvm2.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lvm2/lvm2.hash b/package/lvm2/lvm2.hash
index 982cfc7..eda465d 100644
--- a/package/lvm2/lvm2.hash
+++ b/package/lvm2/lvm2.hash
@@ -1,2 +1,2 @@
 # From ftp://sources.redhat.com/pub/lvm2/md5.sum
-md5  da8d81a6a2ea235025795d9e001a6ae3  LVM2.2.02.124.tgz
+md5  2d24ba982c8a85e8c837210f087a6a51  LVM2.2.02.125.tgz
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index c112b97..0930a10 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LVM2_VERSION = 2.02.124
+LVM2_VERSION = 2.02.125
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE = ftp://sources.redhat.com/pub/lvm2/releases
 LVM2_INSTALL_STAGING = YES
