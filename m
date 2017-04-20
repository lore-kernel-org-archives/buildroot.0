From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 20 Apr 2017 13:32:19 +0100
Subject: [Buildroot] [PATCH] bind: bump version to 9.11.1
Message-ID: <20170420123219.11807-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 8d44d99..9a7fb44 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,2 +1,2 @@
-# Verified from http://ftp.isc.org/isc/bind9/9.11.0-P5/bind-9.11.0-P5.tar.gz.sha256.asc
-sha256 1e283f0567b484687dfd7b936e26c9af4f64043daf73cbd8f3eb1122c9fb71f5  bind-9.11.0-P5.tar.gz
+# Verified from http://ftp.isc.org/isc/bind9/9.11.1/bind-9.11.1.tar.gz.sha256.asc
+sha256 22050095f5c82a1385cc4174190ac60392670bbc5d63d592ecae52a214bc10b2  bind-9.11.1.tar.gz
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 4290455..9c67601 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.11.0-P5
+BIND_VERSION = 9.11.1
 BIND_SITE = ftp://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 # bind does not support parallel builds.
 BIND_MAKE = $(MAKE1)
-- 
2.10.2
