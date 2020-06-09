From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue,  9 Jun 2020 07:47:16 +0200
Subject: [Buildroot] [PATCH] package/bats-core: bump version to 1.2.0
Message-ID: <20200609054717.6443-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And adjust the .hash spacing for the new agreements.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bats-core/bats-core.hash | 4 ++--
 package/bats-core/bats-core.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bats-core/bats-core.hash b/package/bats-core/bats-core.hash
index 4d10d785d6..becc1aecae 100644
--- a/package/bats-core/bats-core.hash
+++ b/package/bats-core/bats-core.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 855d8b8bed466bc505e61123d12885500ef6fcdb317ace1b668087364717ea82  bats-core-1.1.0.tar.gz
+sha256  c74ea5517d9381c044e8e87427de0113be6ad591213d489aeaa28146daf1c723  bats-core-1.2.0.tar.gz
 
 # License files
-sha256 55074b2b3b87809105034e1468e59076554d76a80c67bcc592000cc3d929852d  LICENSE.md
+sha256  55074b2b3b87809105034e1468e59076554d76a80c67bcc592000cc3d929852d  LICENSE.md
diff --git a/package/bats-core/bats-core.mk b/package/bats-core/bats-core.mk
index eee38056fe..2bcfca70d3 100644
--- a/package/bats-core/bats-core.mk
+++ b/package/bats-core/bats-core.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BATS_CORE_VERSION = 1.1.0
+BATS_CORE_VERSION = 1.2.0
 BATS_CORE_SITE = $(call github,bats-core,bats-core,v$(BATS_CORE_VERSION))
 BATS_CORE_LICENSE = MIT
 BATS_CORE_LICENSE_FILES = LICENSE.md
-- 
2.20.1
