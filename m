From: Ben Shelton <benjamin.h.shelton@intel.com>
Date: Tue, 15 Sep 2015 09:35:17 -0500
Subject: [Buildroot] [PATCH v2 1/5] liburcu: Bump version to 0.8.7
Message-ID: <1442327721-24458-1-git-send-email-benjamin.h.shelton@intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ben Shelton <benjamin.h.shelton@intel.com>
---
 package/liburcu/liburcu.hash | 6 +++---
 package/liburcu/liburcu.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/liburcu/liburcu.hash b/package/liburcu/liburcu.hash
index 2b1693d..64ba901 100644
--- a/package/liburcu/liburcu.hash
+++ b/package/liburcu/liburcu.hash
@@ -1,4 +1,4 @@
-# http://www.lttng.org/files/urcu/userspace-rcu-0.8.6.tar.bz2.sha1
-sha1  f10e9bf812557cd0c2a35a277e04010ec278d25d  userspace-rcu-0.8.6.tar.bz2
+# http://www.lttng.org/files/urcu/userspace-rcu-0.8.7.tar.bz2.sha1
+sha1  5306999b8a3296f3dea91246d92e0a993d732898  userspace-rcu-0.8.7.tar.bz2
 # Locally generated
-sha256 b1a5d3bce014ba7a702759bc60b692c1cd46ff0e8a5b53f0d0a95e22db74ab21 userspace-rcu-0.8.6.tar.bz2
+sha256 b523f22c4726ca6bb77a77d258e76d8c33c89724433bd65313024b98e55c4295 userspace-rcu-0.8.7.tar.bz2
diff --git a/package/liburcu/liburcu.mk b/package/liburcu/liburcu.mk
index 1582d07..8d06966 100644
--- a/package/liburcu/liburcu.mk
+++ b/package/liburcu/liburcu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBURCU_VERSION = 0.8.6
+LIBURCU_VERSION = 0.8.7
 LIBURCU_SITE = http://lttng.org/files/urcu
 LIBURCU_SOURCE = userspace-rcu-$(LIBURCU_VERSION).tar.bz2
 LIBURCU_LICENSE = LGPLv2.1+ for the library; MIT-like license for few source files listed in LICENSE; GPLv2+ for test; GPLv3 for few *.m4 files
-- 
1.9.5
