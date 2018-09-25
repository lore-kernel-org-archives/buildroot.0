From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Sep 2018 22:24:20 +0200
Subject: [Buildroot] [git commit] numactl: bump to version 2.0.12
Message-ID: <20180925202356.3666C88D9E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=81dddf29821cf1f7d90b96ad0739116f5c3bf1eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- README has been renamed into README.md so update NUMACTL_LICENSE_FILES
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/numactl/numactl.hash | 3 ++-
 package/numactl/numactl.mk   | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/numactl/numactl.hash b/package/numactl/numactl.hash
index 8a395417f1..d93af1a7bb 100644
--- a/package/numactl/numactl.hash
+++ b/package/numactl/numactl.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 3e099a59b2c527bcdbddd34e1952ca87462d2cef4c93da9b0bc03f02903f7089        numactl-v2.0.11.tar.gz
+sha256 7c3e819c2bdeb883de68bafe88776a01356f7ef565e75ba866c4b49a087c6bdf        numactl-v2.0.12.tar.gz
+sha256 e2b738b1303c088421b09933a78c1326fe43692e2c05a7c510a2eb7e7a8eb575        README.md
diff --git a/package/numactl/numactl.mk b/package/numactl/numactl.mk
index d3ce4f43c0..9efbcb5f67 100644
--- a/package/numactl/numactl.mk
+++ b/package/numactl/numactl.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-NUMACTL_VERSION = v2.0.11
+NUMACTL_VERSION = v2.0.12
 NUMACTL_SITE = $(call github,numactl,numactl,$(NUMACTL_VERSION))
 NUMACTL_LICENSE = LGPL-2.1 (libnuma), GPL-2.0 (programs)
-NUMACTL_LICENSE_FILES = README
+NUMACTL_LICENSE_FILES = README.md
 NUMACTL_INSTALL_STAGING = YES
 NUMACTL_AUTORECONF = YES
 
