From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 13 Mar 2017 11:32:40 +0000
Subject: [Buildroot] [PATCH] ipset: bump version to 6.32
Message-ID: <20170313113240.61989-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/ipset/ipset.hash | 6 +++---
 package/ipset/ipset.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ipset/ipset.hash b/package/ipset/ipset.hash
index 2337c8a..9fa85f2 100644
--- a/package/ipset/ipset.hash
+++ b/package/ipset/ipset.hash
@@ -1,4 +1,4 @@
-# From http://ftp.netfilter.org/pub/ipset/ipset-6.31.tar.bz2.md5sum.txt
-md5	231790be940438287438df1f33857376	ipset-6.31.tar.bz2
+# From http://ftp.netfilter.org/pub/ipset/ipset-6.32.tar.bz2.md5sum.txt
+md5 857a5c6a6d645196865a82bf6fd7f567  ipset-6.32.tar.bz2
 # Calculated based on the hash above
-sha256	498e411cc1d134201a31a56def6c0936c642958c2d4b4ce7d9955240047a45fe	ipset-6.31.tar.bz2
+sha256 d9cbb49a4ae9e32d7808a604f1a37f359f9fc9064c210c4c5f35d629d49fb9fe  ipset-6.32.tar.bz2
diff --git a/package/ipset/ipset.mk b/package/ipset/ipset.mk
index 7d16629..d4b01d9 100644
--- a/package/ipset/ipset.mk
+++ b/package/ipset/ipset.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPSET_VERSION = 6.31
+IPSET_VERSION = 6.32
 IPSET_SOURCE = ipset-$(IPSET_VERSION).tar.bz2
 IPSET_SITE = http://ipset.netfilter.org
 IPSET_DEPENDENCIES = libmnl host-pkgconf
-- 
2.10.2
