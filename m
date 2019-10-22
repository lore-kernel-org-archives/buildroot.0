From: Philippe Proulx <eeppeliteloop@gmail.com>
Date: Tue, 22 Oct 2019 10:48:05 -0400
Subject: [Buildroot] [PATCH 3/3] package/lttng-modules: bump version to
 2.11.0
In-Reply-To: <20191022144805.591535-1-eeppeliteloop@gmail.com>
References: <20191022144805.591535-1-eeppeliteloop@gmail.com>
Message-ID: <20191022144805.591535-3-eeppeliteloop@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
---
 package/lttng-modules/lttng-modules.hash | 4 ++--
 package/lttng-modules/lttng-modules.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lttng-modules/lttng-modules.hash b/package/lttng-modules/lttng-modules.hash
index f06c86cf61..f04247ab0b 100644
--- a/package/lttng-modules/lttng-modules.hash
+++ b/package/lttng-modules/lttng-modules.hash
@@ -1,5 +1,5 @@
-# From http://lttng.org/files/lttng-modules/lttng-modules-2.10.11.tar.bz2.sha256
-sha256 7f91e39b2e8e46d8bbba2b4c8c1614f1fb380611cd1a1fccc1d1859be26112f1  lttng-modules-2.10.11.tar.bz2
+# From https://lttng.org/files/lttng-modules/lttng-modules-2.11.0.tar.bz2.sha256
+sha256 98af92d8c2e00f4eb63bc637a6967103cf6997434493f36e7a535a491e4fad5f  lttng-modules-2.11.0.tar.bz2
 
 # Hash for license files
 sha256 36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  lgpl-2.1.txt
diff --git a/package/lttng-modules/lttng-modules.mk b/package/lttng-modules/lttng-modules.mk
index c54999d374..b8f9be8656 100644
--- a/package/lttng-modules/lttng-modules.mk
+++ b/package/lttng-modules/lttng-modules.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTTNG_MODULES_VERSION = 2.10.11
+LTTNG_MODULES_VERSION = 2.11.0
 LTTNG_MODULES_SITE = http://lttng.org/files/lttng-modules
 LTTNG_MODULES_SOURCE = lttng-modules-$(LTTNG_MODULES_VERSION).tar.bz2
 LTTNG_MODULES_LICENSE = LGPL-2.1/GPL-2.0 (kernel modules), MIT (lib/bitfield.h, lib/prio_heap/*)
-- 
2.23.0
