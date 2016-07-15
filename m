From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 09:51:33 +0200
Subject: [Buildroot] [git commit] jemalloc: bump version to 4.2.1
Message-ID: <20160715075151.1D00C80129@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=554ec255c853191809fdae2333620c2934d9e8d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/jemalloc/jemalloc.hash | 2 +-
 package/jemalloc/jemalloc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/jemalloc/jemalloc.hash b/package/jemalloc/jemalloc.hash
index c24a273..b6c860b 100644
--- a/package/jemalloc/jemalloc.hash
+++ b/package/jemalloc/jemalloc.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 b216ddaeb901697fe38bd30ea02d7505a4b60e8979092009f95cfda860d46acb jemalloc-4.2.0.tar.bz2
+sha256 5630650d5c1caab95d2f0898de4fe5ab8519dc680b04963b38bb425ef6a42d57 jemalloc-4.2.1.tar.bz2
diff --git a/package/jemalloc/jemalloc.mk b/package/jemalloc/jemalloc.mk
index 72ba11f..7086dfa 100644
--- a/package/jemalloc/jemalloc.mk
+++ b/package/jemalloc/jemalloc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JEMALLOC_VERSION = 4.2.0
+JEMALLOC_VERSION = 4.2.1
 JEMALLOC_SOURCE = jemalloc-$(JEMALLOC_VERSION).tar.bz2
 JEMALLOC_SITE = http://www.canonware.com/download/jemalloc
 JEMALLOC_LICENSE = BSD-2c
