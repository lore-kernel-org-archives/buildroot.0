From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Apr 2020 16:17:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/mtools: bump version to 4.0.24
Message-ID: <20200412141716.1334652-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://lists.gnu.org/archive/html/info-mtools/2020-03/msg00000.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mtools/mtools.hash | 2 +-
 package/mtools/mtools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mtools/mtools.hash b/package/mtools/mtools.hash
index 1efc99a6b2..8930c02198 100644
--- a/package/mtools/mtools.hash
+++ b/package/mtools/mtools.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256	c708ff513fada78060a9e55db7c8d169d82d0e3d4afbd7c2744dce6ae0bfdb6d	mtools-4.0.23.tar.lz
+sha256	c443306ae1c5ae9ce749e6f0acc4b8f02d583fe6e4b3732489edb2e7329307d6	mtools-4.0.24.tar.lz
 
 # Locally calculated
 sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
diff --git a/package/mtools/mtools.mk b/package/mtools/mtools.mk
index bd3444022f..268c3003d7 100644
--- a/package/mtools/mtools.mk
+++ b/package/mtools/mtools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MTOOLS_VERSION = 4.0.23
+MTOOLS_VERSION = 4.0.24
 MTOOLS_SOURCE = mtools-$(MTOOLS_VERSION).tar.lz
 MTOOLS_SITE = $(BR2_GNU_MIRROR)/mtools
 MTOOLS_LICENSE = GPL-3.0+
-- 
2.25.0
