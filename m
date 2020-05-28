From: Mario Mintel <mariomintel@gmail.com>
Date: Thu, 28 May 2020 16:43:32 +0200
Subject: [Buildroot] [PATCH 1/2] package/jailhouse: bump version to 0.12
In-Reply-To: <20200528144333.49268-1-mariomintel@gmail.com>
References: <20200528144333.49268-1-mariomintel@gmail.com>
Message-ID: <20200528144333.49268-2-mariomintel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mario Mintel <mariomintel@gmail.com>
---
 package/jailhouse/jailhouse.hash | 2 +-
 package/jailhouse/jailhouse.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/jailhouse/jailhouse.hash b/package/jailhouse/jailhouse.hash
index 9fb4d599da..13a260e8d0 100644
--- a/package/jailhouse/jailhouse.hash
+++ b/package/jailhouse/jailhouse.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 8de2406f455db07794cc750238ce57bc897673ba2b68c56fc9ae2d8079142b33  jailhouse-0.11.tar.gz
+sha256 3777a553c2acb2b693843fe4d16ab80333879daedd47d9c9f3717c9644e6cf93  jailhouse-0.12.tar.gz
 sha256 3aafb31a2436178323663e00511f16d58fc36ea654b1457532e79d017205efd8  COPYING
diff --git a/package/jailhouse/jailhouse.mk b/package/jailhouse/jailhouse.mk
index 1aa7851707..6356c5a7aa 100644
--- a/package/jailhouse/jailhouse.mk
+++ b/package/jailhouse/jailhouse.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JAILHOUSE_VERSION = 0.11
+JAILHOUSE_VERSION = 0.12
 JAILHOUSE_SITE = $(call github,siemens,jailhouse,v$(JAILHOUSE_VERSION))
 JAILHOUSE_LICENSE = GPL-2.0
 JAILHOUSE_LICENSE_FILES = COPYING
-- 
2.26.1
