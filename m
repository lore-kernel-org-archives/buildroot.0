From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Jan 2020 13:40:58 +0100
Subject: [Buildroot] [git commit] package/numactl: bump to version 2.0.13
Message-ID: <20200118123132.140658225E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3a26a444af33b8f463f56f3ac4adceda0deee0f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/numactl/numactl.hash | 2 +-
 package/numactl/numactl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/numactl/numactl.hash b/package/numactl/numactl.hash
index 2536d94754..61cb94b3b3 100644
--- a/package/numactl/numactl.hash
+++ b/package/numactl/numactl.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 7c3e819c2bdeb883de68bafe88776a01356f7ef565e75ba866c4b49a087c6bdf        numactl-2.0.12.tar.gz
+sha256 97ee012b2f294903530424b4ff7f28bcaad6a356897ce8777383f87e5c2e325d        numactl-2.0.13.tar.gz
 sha256 e2b738b1303c088421b09933a78c1326fe43692e2c05a7c510a2eb7e7a8eb575        README.md
diff --git a/package/numactl/numactl.mk b/package/numactl/numactl.mk
index 07c8a806bd..4d3ceeb6c7 100644
--- a/package/numactl/numactl.mk
+++ b/package/numactl/numactl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NUMACTL_VERSION = 2.0.12
+NUMACTL_VERSION = 2.0.13
 NUMACTL_SITE = $(call github,numactl,numactl,v$(NUMACTL_VERSION))
 NUMACTL_LICENSE = LGPL-2.1 (libnuma), GPL-2.0 (programs)
 NUMACTL_LICENSE_FILES = README.md
