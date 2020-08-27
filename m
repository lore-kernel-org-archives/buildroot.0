From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 27 Aug 2020 13:05:13 +0200
Subject: [Buildroot] [PATCH 2/3] package/sysrepo: bump version to 1.4.70
Message-ID: <20200827110513.29938-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/sysrepo/sysrepo.hash | 2 +-
 package/sysrepo/sysrepo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sysrepo/sysrepo.hash b/package/sysrepo/sysrepo.hash
index 894f26380f..cdd2f7e478 100644
--- a/package/sysrepo/sysrepo.hash
+++ b/package/sysrepo/sysrepo.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4dbb916c32e0229238a06bfa929e5615af89e9f79d225b558df99efe6ac84c03  sysrepo-1.4.66.tar.gz
+sha256  f0f894d4ed98ce9d20fda219378b844731d796e95115c07f4c067d853e20ca36  sysrepo-1.4.70.tar.gz
 sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
diff --git a/package/sysrepo/sysrepo.mk b/package/sysrepo/sysrepo.mk
index eb7fdb0e8d..8a2e56bd61 100644
--- a/package/sysrepo/sysrepo.mk
+++ b/package/sysrepo/sysrepo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSREPO_VERSION = 1.4.66
+SYSREPO_VERSION = 1.4.70
 SYSREPO_SITE = $(call github,sysrepo,sysrepo,v$(SYSREPO_VERSION))
 SYSREPO_INSTALL_STAGING = YES
 SYSREPO_LICENSE = Apache-2.0
-- 
2.20.1
