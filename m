From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 16 Jan 2017 11:31:37 -0300
Subject: [Buildroot] [PATCH] proftpd: bump to version 1.3.5d
Message-ID: <20170116143137.7676-1-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/proftpd/proftpd.hash | 6 +++---
 package/proftpd/proftpd.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/proftpd/proftpd.hash b/package/proftpd/proftpd.hash
index 0735340..cc8add9 100644
--- a/package/proftpd/proftpd.hash
+++ b/package/proftpd/proftpd.hash
@@ -1,4 +1,4 @@
-# From ftp://ftp.proftpd.org/distrib/source/proftpd-1.3.5b.tar.gz.md5
-md5	f7b8e3a383b34a894c2502db74ccccde	proftpd-1.3.5b.tar.gz
+# From ftp://ftp.proftpd.org/distrib/source/proftpd-1.3.5d.tar.gz.md5
+md5	bcd2846edf0dad4c4d49a7c8c176d83a	proftpd-1.3.5d.tar.gz
 # Locally calculated
-sha256	afc1789f2478acf88dfdc7d70da90a4fa2786d628218e9574273295d044b4fc8	proftpd-1.3.5b.tar.gz
+sha256	f4e2997be7f22a5b31d7ac72497ed4f4471d24d32385978350410713e76129ac	proftpd-1.3.5d.tar.gz
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index a70f41e..75cdf99 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROFTPD_VERSION = 1.3.5b
+PROFTPD_VERSION = 1.3.5d
 PROFTPD_SOURCE = proftpd-$(PROFTPD_VERSION).tar.gz
 PROFTPD_SITE = ftp://ftp.proftpd.org/distrib/source
 PROFTPD_LICENSE = GPLv2+
-- 
2.10.2
