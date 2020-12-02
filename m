From: Peter Seiderer <ps.report@gmx.net>
Date: Wed,  2 Dec 2020 20:51:25 +0100
Subject: [Buildroot] [PATCH/next v1] package/mtools: bump version to 4.0.26
Message-ID: <20201202195125.14418-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/mtools/mtools.hash | 4 ++--
 package/mtools/mtools.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mtools/mtools.hash b/package/mtools/mtools.hash
index 8930c02198..86cfe693d9 100644
--- a/package/mtools/mtools.hash
+++ b/package/mtools/mtools.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256	c443306ae1c5ae9ce749e6f0acc4b8f02d583fe6e4b3732489edb2e7329307d6	mtools-4.0.24.tar.lz
+sha256  d09cff66d7277ad36a7573fc3e9803bfa558cdda83baabaafbf7761317462283  mtools-4.0.26.tar.lz
 
 # Locally calculated
-sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/mtools/mtools.mk b/package/mtools/mtools.mk
index 268c3003d7..6d63a565bd 100644
--- a/package/mtools/mtools.mk
+++ b/package/mtools/mtools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MTOOLS_VERSION = 4.0.24
+MTOOLS_VERSION = 4.0.26
 MTOOLS_SOURCE = mtools-$(MTOOLS_VERSION).tar.lz
 MTOOLS_SITE = $(BR2_GNU_MIRROR)/mtools
 MTOOLS_LICENSE = GPL-3.0+
-- 
2.29.2
