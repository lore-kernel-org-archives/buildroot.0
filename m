From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 10 Aug 2017 00:00:38 +0200
Subject: [Buildroot] [git commit branch/next] package/lvm2: bump version to
	2.02.173
Message-ID: <20170809221936.9E22D7FD28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1dbf315f4eaece8fc64159cb750d4fd4f979dfaf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/lvm2/lvm2.hash | 2 +-
 package/lvm2/lvm2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lvm2/lvm2.hash b/package/lvm2/lvm2.hash
index 81d0e97..9f7a6c6 100644
--- a/package/lvm2/lvm2.hash
+++ b/package/lvm2/lvm2.hash
@@ -1,2 +1,2 @@
 # From ftp://sources.redhat.com/pub/lvm2/releases/sha512.sum
-sha512 801adcc2ae483f81edf6bfba73090b6b8f710370e48764f08a62da71d617157075bea01593c2535ad5ba71dcb5e0cfe83cec9a65180a6e8b9e0d214bdee79883  LVM2.2.02.171.tgz
+sha512 c2ea8beafe006abf9282f51ec98600fd0ebff816d53c10ecbb19bbf336ada4825135cf9c92ccd364afb18f8b1d7e163eff5bdec8dfdd70dfb9ba45db2f6bdd5e  LVM2.2.02.173.tgz
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index f5cd0b5..63ac109 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LVM2_VERSION = 2.02.171
+LVM2_VERSION = 2.02.173
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE = ftp://sources.redhat.com/pub/lvm2/releases
 LVM2_INSTALL_STAGING = YES
