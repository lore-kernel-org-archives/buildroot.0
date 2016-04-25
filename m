From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Apr 2016 21:22:19 +0200
Subject: [Buildroot] [git commit] lvm2: bump version to 2.02.151
Message-ID: <20160425192429.EC2C4803C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7410b8e0ce50c6a989e5708f86518b164fad40b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lvm2/lvm2.hash | 2 +-
 package/lvm2/lvm2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lvm2/lvm2.hash b/package/lvm2/lvm2.hash
index 959be39..7e1458a 100644
--- a/package/lvm2/lvm2.hash
+++ b/package/lvm2/lvm2.hash
@@ -1,2 +1,2 @@
 # From ftp://sources.redhat.com/pub/lvm2/releases/sha512.sum
-sha512 66d1a247170f685c72d91d5fc52a2394ba5d5a477686101b9a472a8ac163813f9c80c0d75e4f29939b16000456263e9191cd294520ab5b320915f23f0797f22e  LVM2.2.02.150.tgz
+sha512 b2def85d380fb96b40537fac4fdc7c14a009a45b0a1cdfb48714fe99d6f6a659376e0f762cc7dd778c747bab75427f13948895d6eb28a05cfc752a4eca56ee81  LVM2.2.02.151.tgz
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index d78f621..b1783c9 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LVM2_VERSION = 2.02.150
+LVM2_VERSION = 2.02.151
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE = ftp://sources.redhat.com/pub/lvm2/releases
 LVM2_INSTALL_STAGING = YES
