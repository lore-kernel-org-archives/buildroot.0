From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat,  9 Jan 2021 18:55:07 +0100
Subject: [Buildroot] [PATCH] package/bats-core: bump version to 1.2.1
Message-ID: <20210109175507.12578-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For details, see the release notes:
https://github.com/bats-core/bats-core/releases/tag/v1.2.1

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bats-core/bats-core.hash | 2 +-
 package/bats-core/bats-core.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bats-core/bats-core.hash b/package/bats-core/bats-core.hash
index becc1aecae..b50543a269 100644
--- a/package/bats-core/bats-core.hash
+++ b/package/bats-core/bats-core.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  c74ea5517d9381c044e8e87427de0113be6ad591213d489aeaa28146daf1c723  bats-core-1.2.0.tar.gz
+sha256  91c49b1fe6f0656c46491929ed728f8dfa9a96df0cce294963e8c6082bff87a2  bats-core-1.2.1.tar.gz
 
 # License files
 sha256  55074b2b3b87809105034e1468e59076554d76a80c67bcc592000cc3d929852d  LICENSE.md
diff --git a/package/bats-core/bats-core.mk b/package/bats-core/bats-core.mk
index 2bcfca70d3..fc8ac674ae 100644
--- a/package/bats-core/bats-core.mk
+++ b/package/bats-core/bats-core.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BATS_CORE_VERSION = 1.2.0
+BATS_CORE_VERSION = 1.2.1
 BATS_CORE_SITE = $(call github,bats-core,bats-core,v$(BATS_CORE_VERSION))
 BATS_CORE_LICENSE = MIT
 BATS_CORE_LICENSE_FILES = LICENSE.md
-- 
2.20.1
