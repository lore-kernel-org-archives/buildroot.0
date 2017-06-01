From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Jun 2017 20:28:52 -0000
Subject: [Buildroot] [git commit] lttng-modules: bump version to 2.9.2
Message-ID: <20170601202849.2462982612@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e285cabf7d4b8dee3f173dc678ee16bcb6525b5a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lttng-modules/lttng-modules.hash | 6 +++---
 package/lttng-modules/lttng-modules.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lttng-modules/lttng-modules.hash b/package/lttng-modules/lttng-modules.hash
index ec733ef..6849d5d 100644
--- a/package/lttng-modules/lttng-modules.hash
+++ b/package/lttng-modules/lttng-modules.hash
@@ -1,3 +1,3 @@
-# From http://lttng.org/files/lttng-modules/lttng-modules-2.9.1.tar.bz2.{md5,sha1}
-md5 5a16bca52233cc2bdff572b1120a88f6  lttng-modules-2.9.1.tar.bz2
-sha1 5b47e923a8d697b0f5799f0eb226a41c4957966c  lttng-modules-2.9.1.tar.bz2
+# From http://lttng.org/files/lttng-modules/lttng-modules-2.9.2.tar.bz2.{md5,sha1}
+md5 6c02645c77fd4d6475a4f83bda1d75ff  lttng-modules-2.9.2.tar.bz2
+sha1 da54a8478019c0d551590c37826e78c058e9cb8b  lttng-modules-2.9.2.tar.bz2
diff --git a/package/lttng-modules/lttng-modules.mk b/package/lttng-modules/lttng-modules.mk
index 9f624e5..f53b085 100644
--- a/package/lttng-modules/lttng-modules.mk
+++ b/package/lttng-modules/lttng-modules.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTTNG_MODULES_VERSION = 2.9.1
+LTTNG_MODULES_VERSION = 2.9.2
 LTTNG_MODULES_SITE = http://lttng.org/files/lttng-modules
 LTTNG_MODULES_SOURCE = lttng-modules-$(LTTNG_MODULES_VERSION).tar.bz2
 LTTNG_MODULES_LICENSE = LGPL-2.1/GPL-2.0 (kernel modules), MIT (lib/bitfield.h, lib/prio_heap/*)
