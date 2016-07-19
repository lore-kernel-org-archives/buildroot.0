From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 19 Jul 2016 10:29:06 +0100
Subject: [Buildroot] [PATCH] bind: bump version to 9.10.4-P2
Message-ID: <1468920546-50576-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Security fixes: CVE-2016-2775

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 1f8b8b7..0fb4eb4 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,2 +1,2 @@
-# Verified from ftp://ftp.isc.org/isc/bind9/9.10.4/bind-9.10.4.tar.gz.sha256.asc
-sha256	f8d412b38d5ac390275b943bde69f4608f67862a45487ec854b30e4448fcb056	bind-9.10.4.tar.gz
+# Verified from ftp://ftp.isc.org/isc/bind9/9.10.4-P2/bind-9.10.4-P2.tar.gz.sha256.asc
+sha256 b35b8af8fe030196d03b3e487f5ecd0c0836b5e124abc7a3ecd184740b444423  bind-9.10.4-P2.tar.gz
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 8cfcf7f..fc9e30e 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.10.4
+BIND_VERSION = 9.10.4-P2
 BIND_SITE = ftp://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 # bind does not support parallel builds.
 BIND_MAKE = $(MAKE1)
-- 
2.7.3
