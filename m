From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 15 Aug 2019 16:01:46 +0200
Subject: [Buildroot] [PATCH 4/4] package/batcl: bump to version 2019.3
In-Reply-To: <20190815140146.28224-1-fontaine.fabrice@gmail.com>
References: <20190815140146.28224-1-fontaine.fabrice@gmail.com>
Message-ID: <20190815140146.28224-4-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add license files and their hash

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/batctl/batctl.hash | 8 +++++---
 package/batctl/batctl.mk   | 3 ++-
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/batctl/batctl.hash b/package/batctl/batctl.hash
index 257e1ff207..94f3de0230 100644
--- a/package/batctl/batctl.hash
+++ b/package/batctl/batctl.hash
@@ -1,4 +1,6 @@
-# From https://downloads.open-mesh.org/batman/releases/batman-adv-2017.0/batctl-2017.0.tar.gz.sha1
-sha1 0fbc329b56b465fa4f674cfecd7348144609f8e5  batctl-2017.0.tar.gz
+# From https://downloads.open-mesh.org/batman/releases/batman-adv-2019.3/batctl-2019.3.tar.gz.sha1
+sha1 3a1357d51e9338e79e9953b7d8b33ace9f904b30  batctl-2019.3.tar.gz
 # Locally calculated
-sha256 c0bb1127d6070b46abeb8d6a63d1150d71fa85f87f9a846873b649a21934c686  batctl-2017.0.tar.gz
+sha256 2bd93fa14925a8dc63a67e64266c8ccd2fa3ac44b10253d93e6f8a630350070c  batctl-2019.3.tar.gz
+sha256 cecbf53d1148e13256ac29f8b900655b7fc8dc12d59939a95bc2323ea1747025  LICENSES/preferred/GPL-2.0
+sha256 323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  LICENSES/preferred/MIT
diff --git a/package/batctl/batctl.mk b/package/batctl/batctl.mk
index 824d2e15f5..17ed15e36d 100644
--- a/package/batctl/batctl.mk
+++ b/package/batctl/batctl.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-BATCTL_VERSION = 2017.0
+BATCTL_VERSION = 2019.3
 BATCTL_SITE = http://downloads.open-mesh.org/batman/releases/batman-adv-$(BATCTL_VERSION)
 BATCTL_LICENSE = GPL-2.0, MIT (batman_adv.h, list.h)
+BATCTL_LICENSE_FILES = LICENSES/preferred/GPL-2.0 LICENSES/preferred/MIT
 BATCTL_DEPENDENCIES = libnl host-pkgconf
 
 define BATCTL_BUILD_CMDS
-- 
2.20.1
