From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 28 Sep 2019 08:26:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/e2fsprogs: security bump version to
 1.45.4
Message-ID: <20190928062635.8553-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2019-5094:
http://e2fsprogs.sourceforge.net/e2fsprogs-release.html#1.45.4

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/e2fsprogs/e2fsprogs.hash | 4 ++--
 package/e2fsprogs/e2fsprogs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs.hash b/package/e2fsprogs/e2fsprogs.hash
index 18a0d2f98e..c9018715c7 100644
--- a/package/e2fsprogs/e2fsprogs.hash
+++ b/package/e2fsprogs/e2fsprogs.hash
@@ -1,5 +1,5 @@
-# https://mirrors.edge.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.45.3/sha256sums.asc
-sha256 90d10066b815e27b0b4875f0d5e396c663e0bf55aa3ca10868978d10c6ffe595 e2fsprogs-1.45.3.tar.xz
+# https://mirrors.edge.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.45.4/sha256sums.asc
+sha256 65faf6b590ca1da97440d6446bd11de9e0914b42553740ba5d9d2a796fa0dc02  e2fsprogs-1.45.4.tar.xz
 # Locally calculated
 sha256 5da5ef153e559c1d990d4c3eedbedd4442db892d37eae1f35fff069de8ec9020  NOTICE
 sha256 032989b508f1a72ebee5b3417e55d06d473f9ee203e45ab11864a7e49cdec63d  lib/ss/mit-sipb-copyright.h
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index e65b042098..28fd78047f 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-E2FSPROGS_VERSION = 1.45.3
+E2FSPROGS_VERSION = 1.45.4
 E2FSPROGS_SOURCE = e2fsprogs-$(E2FSPROGS_VERSION).tar.xz
 E2FSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/tytso/e2fsprogs/v$(E2FSPROGS_VERSION)
 E2FSPROGS_LICENSE = GPL-2.0, MIT-like with advertising clause (libss and libet)
-- 
2.20.1
