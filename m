From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Sat,  3 Oct 2020 22:28:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/numactl: bump to version 2.0.14
Message-ID: <1601756890-7566-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also update hash file formatting (2 spaces)

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/numactl/numactl.hash | 4 ++--
 package/numactl/numactl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/numactl/numactl.hash b/package/numactl/numactl.hash
index 61cb94b..802175d 100644
--- a/package/numactl/numactl.hash
+++ b/package/numactl/numactl.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 97ee012b2f294903530424b4ff7f28bcaad6a356897ce8777383f87e5c2e325d        numactl-2.0.13.tar.gz
-sha256 e2b738b1303c088421b09933a78c1326fe43692e2c05a7c510a2eb7e7a8eb575        README.md
+sha256  1ee27abd07ff6ba140aaf9bc6379b37825e54496e01d6f7343330cf1a4487035  numactl-2.0.14.tar.gz
+sha256  e2b738b1303c088421b09933a78c1326fe43692e2c05a7c510a2eb7e7a8eb575  README.md
diff --git a/package/numactl/numactl.mk b/package/numactl/numactl.mk
index 4d3ceeb..d0dd5c2 100644
--- a/package/numactl/numactl.mk
+++ b/package/numactl/numactl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NUMACTL_VERSION = 2.0.13
+NUMACTL_VERSION = 2.0.14
 NUMACTL_SITE = $(call github,numactl,numactl,v$(NUMACTL_VERSION))
 NUMACTL_LICENSE = LGPL-2.1 (libnuma), GPL-2.0 (programs)
 NUMACTL_LICENSE_FILES = README.md
-- 
2.7.4
