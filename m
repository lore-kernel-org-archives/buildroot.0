From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 03 Sep 2019 13:40:43 -0000
Subject: [Buildroot] [git commit] package/strace: bump to version 5.2
Message-ID: <20190903133620.E62828A5E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c0e3254990c113ec734dd939c7ec6ef2bb11763c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/strace/strace.hash | 4 ++--
 package/strace/strace.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index bcd09315f1..51436cf850 100644
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
index f957144160..9ec81728e2 100644
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
