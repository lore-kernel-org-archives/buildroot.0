From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 14 Sep 2020 19:46:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/libpfm4: bump to version 4.11.0
Message-ID: <20200914174619.3409389-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Major updates:
 - AMD Zen1 core PMU updates
 - AMD Zen2 core PMU support
 - Intel Icelake core PMU support
 - support to report if events are speculative
 - support for Extended PEBS events on Icelake
 - Intel Tremont core PMU support
 - ARM Neoverse N1 core PMU support
 - s390 event table updates
 - Marvell TX2 core and uncore updates
 - Intel CascadeLakeX uncore PMU support
 - Various other event table updates and bug fixes

http://perfmon2.sourceforge.net/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libpfm4/libpfm4.hash | 6 +++---
 package/libpfm4/libpfm4.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libpfm4/libpfm4.hash b/package/libpfm4/libpfm4.hash
index 2c1442dd11..bdc7806a7c 100644
--- a/package/libpfm4/libpfm4.hash
+++ b/package/libpfm4/libpfm4.hash
@@ -1,6 +1,6 @@
 # From http://sourceforge.net/projects/perfmon2/files/libpfm4/:
-sha1  78599e1668142f48c24afb1f79ca00a89df51b65  libpfm-4.10.1.tar.gz
-md5  d8f66cb9bfa7e1434434e0de6409db5b  libpfm-4.10.1.tar.gz
+sha1  112bced9a67d565ff0ce6c2bb90452516d1183e5  libpfm-4.11.0.tar.gz
+md5  4811c1d99b95752b4ba53b89a9389ec3  libpfm-4.11.0.tar.gz
 # Locally calculated
-sha256  c61c575378b5c17ccfc5806761e4038828610de76e2e34fac9f7fa73ba844b49  libpfm-4.10.1.tar.gz
+sha256  5da5f8872bde14b3634c9688d980f68bda28b510268723cc12973eedbab9fecc  libpfm-4.11.0.tar.gz
 sha256  beef323d68fc5db9c67b20e8e9de7ccde371d20cdbcdd686804055b18b926d90  COPYING
diff --git a/package/libpfm4/libpfm4.mk b/package/libpfm4/libpfm4.mk
index cc89d4422b..3692ebabe7 100644
--- a/package/libpfm4/libpfm4.mk
+++ b/package/libpfm4/libpfm4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPFM4_VERSION = 4.10.1
+LIBPFM4_VERSION = 4.11.0
 LIBPFM4_SOURCE = libpfm-$(LIBPFM4_VERSION).tar.gz
 LIBPFM4_SITE = http://downloads.sourceforge.net/project/perfmon2/libpfm4
 LIBPFM4_LICENSE = libpfm4 license
-- 
2.28.0
