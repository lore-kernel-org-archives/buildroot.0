From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 22 May 2017 14:07:05 +0200
Subject: [Buildroot] [git commit branch/next] package/batctl: bump version
	to 2017.0
Message-ID: <20170522120918.8A2EA820E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d39df12dd79e39d8d6835e2220504ecd91256cf7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/batctl/batctl.hash | 6 +++---
 package/batctl/batctl.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/batctl/batctl.hash b/package/batctl/batctl.hash
index 5920ff0..257e1ff 100644
--- a/package/batctl/batctl.hash
+++ b/package/batctl/batctl.hash
@@ -1,4 +1,4 @@
-# http://downloads.open-mesh.org/batman/releases/batman-adv-2016.1/batctl-2016.1.tar.gz.sha1
-sha1 72b974bde707594e2cf0cc122d7d7da0f1f65160 batctl-2016.1.tar.gz
+# From https://downloads.open-mesh.org/batman/releases/batman-adv-2017.0/batctl-2017.0.tar.gz.sha1
+sha1 0fbc329b56b465fa4f674cfecd7348144609f8e5  batctl-2017.0.tar.gz
 # Locally calculated
-sha256 c854397b2ddd2cb8d15d1e65839819380648ccb37507d0303e133011fe6f03c9  batctl-2016.1.tar.gz
+sha256 c0bb1127d6070b46abeb8d6a63d1150d71fa85f87f9a846873b649a21934c686  batctl-2017.0.tar.gz
diff --git a/package/batctl/batctl.mk b/package/batctl/batctl.mk
index 73d4598..122263e 100644
--- a/package/batctl/batctl.mk
+++ b/package/batctl/batctl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BATCTL_VERSION = 2016.1
+BATCTL_VERSION = 2017.0
 BATCTL_SITE = http://downloads.open-mesh.org/batman/releases/batman-adv-$(BATCTL_VERSION)
 BATCTL_LICENSE = GPL-2.0
 BATCTL_DEPENDENCIES = libnl host-pkgconf
