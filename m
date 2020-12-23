From: Antoine Tenart <atenart@kernel.org>
Date: Wed, 23 Dec 2020 11:50:29 +0100
Subject: [Buildroot] [PATCH] package/refpolicy: bump to 2.20200818
Message-ID: <20201223105029.3520409-1-atenart@kernel.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog:
https://github.com/SELinuxProject/refpolicy/releases/tag/RELEASE_2_20200818

Signed-off-by: Antoine Tenart <atenart@kernel.org>
---
 package/refpolicy/refpolicy.hash | 2 +-
 package/refpolicy/refpolicy.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/refpolicy/refpolicy.hash b/package/refpolicy/refpolicy.hash
index 8605d07c08d5..7e258c4e04d9 100644
--- a/package/refpolicy/refpolicy.hash
+++ b/package/refpolicy/refpolicy.hash
@@ -1,5 +1,5 @@
 # From https://github.com/SELinuxProject/refpolicy/releases
-sha256 dec854512ed00cd057408f330c2cea4de7a4405f7a147458f59c994bf578e4b0  refpolicy-2.20200229.tar.bz2
+sha256 1488f9b94060de28addbcb29fb8437ee0d75cba15e11280dd9dfa3e09986f57b  refpolicy-2.20200818.tar.bz2
 
 # Locally computed
 sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994 COPYING
diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index 0e94b7282624..59e142634200 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -21,9 +21,9 @@ REFPOLICY_SITE = $(call qstrip,$(BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_URL))
 REFPOLICY_SITE_METHOD = git
 BR_NO_CHECK_HASH_FOR += $(REFPOLICY_SOURCE)
 else
-REFPOLICY_VERSION = 2.20200229
+REFPOLICY_VERSION = 2.20200818
 REFPOLICY_SOURCE = refpolicy-$(REFPOLICY_VERSION).tar.bz2
-REFPOLICY_SITE = https://github.com/SELinuxProject/refpolicy/releases/download/RELEASE_2_20200229
+REFPOLICY_SITE = https://github.com/SELinuxProject/refpolicy/releases/download/RELEASE_2_20200818
 endif
 
 # Cannot use multiple threads to build the reference policy
-- 
2.29.2
