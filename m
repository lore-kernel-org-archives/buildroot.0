From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Jan 2021 21:21:58 +0100
Subject: [Buildroot] [git commit] package/sysrepo: bump version to 1.4.104
Message-ID: <20210131200219.7CD0B85FD7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aaba56ce3facda0614155edf3f76001a75727afe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sysrepo/sysrepo.hash | 2 +-
 package/sysrepo/sysrepo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sysrepo/sysrepo.hash b/package/sysrepo/sysrepo.hash
index cdd2f7e478..d0b3c82ad3 100644
--- a/package/sysrepo/sysrepo.hash
+++ b/package/sysrepo/sysrepo.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f0f894d4ed98ce9d20fda219378b844731d796e95115c07f4c067d853e20ca36  sysrepo-1.4.70.tar.gz
+sha256  635f68ad5f8cb5ea3bd7c3081963f1a9a79ee0d6570facb1f3bcbf3b640446a4  sysrepo-1.4.104.tar.gz
 sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
diff --git a/package/sysrepo/sysrepo.mk b/package/sysrepo/sysrepo.mk
index 8a2e56bd61..e4d553cdbd 100644
--- a/package/sysrepo/sysrepo.mk
+++ b/package/sysrepo/sysrepo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSREPO_VERSION = 1.4.70
+SYSREPO_VERSION = 1.4.104
 SYSREPO_SITE = $(call github,sysrepo,sysrepo,v$(SYSREPO_VERSION))
 SYSREPO_INSTALL_STAGING = YES
 SYSREPO_LICENSE = Apache-2.0
