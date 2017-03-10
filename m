From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 10 Mar 2017 17:42:52 +0000
Subject: [Buildroot] [PATCH 2/2] lttng-modules: bump version to 2.9.1
In-Reply-To: <20170310174252.20236-1-Vincent.Riera@imgtec.com>
References: <20170310174252.20236-1-Vincent.Riera@imgtec.com>
Message-ID: <20170310174252.20236-2-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/lttng-modules/lttng-modules.hash | 6 +++---
 package/lttng-modules/lttng-modules.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lttng-modules/lttng-modules.hash b/package/lttng-modules/lttng-modules.hash
index d8314f6..ec733ef 100644
--- a/package/lttng-modules/lttng-modules.hash
+++ b/package/lttng-modules/lttng-modules.hash
@@ -1,3 +1,3 @@
-# From http://lttng.org/files/lttng-modules/lttng-modules-2.9.0.tar.bz2.{md5,sha1}
-md5 717df375ccb6f32bb297cc2f2e692bbf  lttng-modules-2.9.0.tar.bz2
-sha1 819ee1c2a5a821b7fdc1c2fc102ef3079c32aad7  lttng-modules-2.9.0.tar.bz2
+# From http://lttng.org/files/lttng-modules/lttng-modules-2.9.1.tar.bz2.{md5,sha1}
+md5 5a16bca52233cc2bdff572b1120a88f6  lttng-modules-2.9.1.tar.bz2
+sha1 5b47e923a8d697b0f5799f0eb226a41c4957966c  lttng-modules-2.9.1.tar.bz2
diff --git a/package/lttng-modules/lttng-modules.mk b/package/lttng-modules/lttng-modules.mk
index aa0ac30..e77617e 100644
--- a/package/lttng-modules/lttng-modules.mk
+++ b/package/lttng-modules/lttng-modules.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTTNG_MODULES_VERSION = 2.9.0
+LTTNG_MODULES_VERSION = 2.9.1
 LTTNG_MODULES_SITE = http://lttng.org/files/lttng-modules
 LTTNG_MODULES_SOURCE = lttng-modules-$(LTTNG_MODULES_VERSION).tar.bz2
 LTTNG_MODULES_LICENSE = LGPLv2.1/GPLv2 (kernel modules), MIT (lib/bitfield.h, lib/prio_heap/*)
-- 
2.10.2
