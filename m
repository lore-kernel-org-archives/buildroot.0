From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Feb 2021 08:47:43 +0100
Subject: [Buildroot] [git commit] package/refpolicy: bump to 2.20210203
Message-ID: <20210308072136.1A8D988918@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d1d5c1c9141ab4e510938715d1a397a817f078e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://github.com/SELinuxProject/refpolicy/releases/tag/RELEASE_2_20210203

Signed-off-by: Antoine Tenart <atenart@kernel.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/refpolicy/refpolicy.hash | 2 +-
 package/refpolicy/refpolicy.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/refpolicy/refpolicy.hash b/package/refpolicy/refpolicy.hash
index 7e258c4e04..6c33a4d974 100644
--- a/package/refpolicy/refpolicy.hash
+++ b/package/refpolicy/refpolicy.hash
@@ -1,5 +1,5 @@
 # From https://github.com/SELinuxProject/refpolicy/releases
-sha256 1488f9b94060de28addbcb29fb8437ee0d75cba15e11280dd9dfa3e09986f57b  refpolicy-2.20200818.tar.bz2
+sha256 48cbf2c63ff9003bef05e03c8d3cdddb4e8f63fef2a072ae51c987301f0b874d  refpolicy-2.20210203.tar.bz2
 
 # Locally computed
 sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994 COPYING
diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index 0194708b37..0e7dfd86f8 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -22,9 +22,9 @@ REFPOLICY_SITE = $(call qstrip,$(BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_URL))
 REFPOLICY_SITE_METHOD = git
 BR_NO_CHECK_HASH_FOR += $(REFPOLICY_SOURCE)
 else
-REFPOLICY_VERSION = 2.20200818
+REFPOLICY_VERSION = 2.20210203
 REFPOLICY_SOURCE = refpolicy-$(REFPOLICY_VERSION).tar.bz2
-REFPOLICY_SITE = https://github.com/SELinuxProject/refpolicy/releases/download/RELEASE_2_20200818
+REFPOLICY_SITE = https://github.com/SELinuxProject/refpolicy/releases/download/RELEASE_2_20210203
 endif
 
 # Cannot use multiple threads to build the reference policy
