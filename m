From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sun,  8 Dec 2019 12:19:25 -0800
Subject: [Buildroot] [PATCH 03/11] package/refpolicy: bump version to
 2.20190609
In-Reply-To: <20191208201933.3832327-1-aduskett@gmail.com>
References: <20191208201933.3832327-1-aduskett@gmail.com>
Message-ID: <20191208201933.3832327-3-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/refpolicy/refpolicy.hash | 2 +-
 package/refpolicy/refpolicy.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/refpolicy/refpolicy.hash b/package/refpolicy/refpolicy.hash
index 856d8cb8a2..0c77b626cc 100644
--- a/package/refpolicy/refpolicy.hash
+++ b/package/refpolicy/refpolicy.hash
@@ -1,5 +1,5 @@
 # From https://github.com/SELinuxProject/refpolicy/releases
-sha256 ed620dc91c4e09eee6271b373f7c61a364a82ea57bd2dc86ca1f7075304e2843  refpolicy-2.20190201.tar.bz2
+sha256 67bd1213e9d014ada15512028bb7f35ef6610c2d209cc5117b8577474aa6147f  refpolicy-2.20190609.tar.bz2
 
 # Locally computed
 sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994 COPYING
diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index 1c3b1bc541..bc4eed815b 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-REFPOLICY_VERSION = 2.20190201
+REFPOLICY_VERSION = 2.20190609
 REFPOLICY_SOURCE = refpolicy-$(REFPOLICY_VERSION).tar.bz2
-REFPOLICY_SITE = https://github.com/SELinuxProject/refpolicy/releases/download/RELEASE_2_20190201
+REFPOLICY_SITE = https://github.com/SELinuxProject/refpolicy/releases/download/RELEASE_2_20190609
 REFPOLICY_LICENSE = GPL-2.0
 REFPOLICY_LICENSE_FILES = COPYING
 REFPOLICY_INSTALL_STAGING = YES
-- 
2.23.0
