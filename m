From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 16 Aug 2019 06:54:37 +0300
Subject: [Buildroot] [PATCH next 1/2] package/strace: bump to version 5.2
Message-ID: <2dbcdf78584fc5d00cc68a5582510af74ed0588a.1565927678.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/strace/strace.hash | 4 ++--
 package/strace/strace.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index bcd09315f1bf..51436cf85055 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature with RSA key 0xA8041FA839E16E36
-# https://strace.io/files/5.0/strace-5.0.tar.xz.asc
-sha256	3b7ad77eb2b81dc6078046a9cc56eed5242b67b63748e7fc28f7c2daf4e647da	strace-5.0.tar.xz
+# https://strace.io/files/5.2/strace-5.2.tar.xz.asc
+sha256	d513bc085609a9afd64faf2ce71deb95b96faf46cd7bc86048bc655e4e4c24d2	strace-5.2.tar.xz
 sha256	739b2725197137a04ab48ee6b19da3fdf7e497249e0dedd9f51c11a570401ede	COPYING
 sha256	7c379436436a562834aa7d2f5dcae1f80a25230fa74201046ca1fba4367d39aa	LGPL-2.1-or-later
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index f957144160af..9ec81728e205 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 5.0
+STRACE_VERSION = 5.2
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = https://strace.io/files/$(STRACE_VERSION)
 STRACE_LICENSE = LGPL-2.1+
-- 
2.23.0.rc1
