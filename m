From: Geoff Levand <geoff@infradead.org>
Date: Tue, 24 Jul 2018 19:32:17 +0000
Subject: [Buildroot] [PATCH v1 1/2] dtc: bump version to 1.4.7
Message-ID: <28d7fee033a5e5ef512c02d5291d20b1d19fdbbf.1532460521.git.geoff@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump from 1.4.4 to 1.4.7.

Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 package/dtc/dtc.hash | 2 +-
 package/dtc/dtc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dtc/dtc.hash b/package/dtc/dtc.hash
index 75c2e40eea..b402c2249b 100644
--- a/package/dtc/dtc.hash
+++ b/package/dtc/dtc.hash
@@ -1,2 +1,2 @@
 # from https://www.kernel.org/pub/software/utils/dtc/sha256sums.asc
-sha256 470731d5c015b160d26a96645dbb1c7337d6e7b8c98244612002b66bedf6cffb  dtc-1.4.4.tar.xz
+sha256 6643e8f00ff86350f465bb54b2185058b5b1b7bac01a0842c81a52b86589cde7 dtc-1.4.7.tar.xz
diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
index 1bcee29bb3..8388793c01 100644
--- a/package/dtc/dtc.mk
+++ b/package/dtc/dtc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DTC_VERSION = 1.4.4
+DTC_VERSION = 1.4.7
 DTC_SOURCE = dtc-$(DTC_VERSION).tar.xz
 DTC_SITE = https://www.kernel.org/pub/software/utils/dtc
 DTC_LICENSE = GPL-2.0+ or BSD-2-Clause (library)
-- 
2.14.1
