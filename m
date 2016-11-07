From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Nov 2016 22:09:10 +0100
Subject: [Buildroot] [git commit branch/next] lvm2: bump version to 2.02.167
Message-ID: <20161107210924.11F5B817B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=24fa2acca61ec9d82eebcb2e538cc98b05ebe260
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lvm2/lvm2.hash | 2 +-
 package/lvm2/lvm2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lvm2/lvm2.hash b/package/lvm2/lvm2.hash
index a269eb6..edc9360 100644
--- a/package/lvm2/lvm2.hash
+++ b/package/lvm2/lvm2.hash
@@ -1,2 +1,2 @@
 # From ftp://sources.redhat.com/pub/lvm2/releases/sha512.sum
-sha512 8bebe9b474f791b5edf5366b0bd24861fbbaf8a83afa2a9e2a8e3917e05e4ecbf6877f018be03ffb4e9b4c8832208264165b85182bf79a07661adf35128b4a21  LVM2.2.02.166.tgz
+sha512 492b2f5ca462dbbb8e182befdb6ca60c7a31b16a39f59a38cabdcd0996d9e2c49ae56a2289def80b89da738176ac55cf13cbefd401feb7a1e3a6ef9a4c267f2b  LVM2.2.02.167.tgz
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index d76cdd2..dd57421 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LVM2_VERSION = 2.02.166
+LVM2_VERSION = 2.02.167
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE = ftp://sources.redhat.com/pub/lvm2/releases
 LVM2_INSTALL_STAGING = YES
