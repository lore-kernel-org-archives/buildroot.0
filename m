From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sat, 30 Jan 2021 22:40:31 +0100
Subject: [Buildroot] [PATCH 3/4] package/sysrepo: bump version to 1.4.104
In-Reply-To: <20210130214028.26398-1-heiko.thiery@gmail.com>
References: <20210130214028.26398-1-heiko.thiery@gmail.com>
Message-ID: <20210130214028.26398-4-heiko.thiery@gmail.com>
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
-- 
2.20.1
