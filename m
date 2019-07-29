From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 29 Jul 2019 20:01:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/icu: bump version to 64.2
Message-ID: <20190729180147.6413-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Updated license hash after upstream commit:
https://github.com/unicode-org/icu/commit/fc255de3f050271198074c7e8865a805d33c20c4

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/icu/icu.hash | 7 ++++---
 package/icu/icu.mk   | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/icu/icu.hash b/package/icu/icu.hash
index 66a0a8dc80..86de0e14ea 100644
--- a/package/icu/icu.hash
+++ b/package/icu/icu.hash
@@ -1,3 +1,4 @@
-# From http://download.icu-project.org/files/icu4c/60.2/SHASUM512.txt
-sha512 8e718e66c13e7f25714404c46b91ed6305efff1df70c328be2ec743023a7719016dae72a5fa0a05d6f5599983590a2044ff72d3453a048d987ab546d0416d694  icu4c-60_2-src.tgz
-sha256 24c771ce37201a3ab604852e47d10d21595d0493269dd6c8a5e567e998e18c00  LICENSE
+# From http://download.icu-project.org/files/icu4c/64.2/SHASUM512.txt
+sha512 5ecb4c230ba45918747a1cf9aef86f555aa07d5b29b1d07ab674e8013f46dfb907a0e9d6945db41155f9dc3012fd94e1152ffc19f61a68b6dfcbabdcb8ae9d78  icu4c-64_2-src.tgz
+# Locally computed
+sha256 6a18c5fac70d7860b57f5b72b4e2c9a1ba6b3d2741eef7ff9767c5379364f10d  LICENSE
diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index 7bc1b97624..81d1dbc179 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -7,7 +7,7 @@
 # Git tags (and therefore versions on release-monitoring.org) use the
 # XX-Y format, but the tarballs are named XX_Y and the containing
 # directories XX.Y.
-ICU_VERSION = 60-2
+ICU_VERSION = 64-2
 ICU_SOURCE = icu4c-$(subst -,_,$(ICU_VERSION))-src.tgz
 ICU_SITE = http://download.icu-project.org/files/icu4c/$(subst -,.,$(ICU_VERSION))
 ICU_LICENSE = ICU License
-- 
2.20.1
