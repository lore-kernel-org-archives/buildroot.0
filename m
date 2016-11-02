From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 2 Nov 2016 14:29:41 +0000
Subject: [Buildroot] [PATCH] bind: bump version to 9.11.0-P1 (security)
Message-ID: <20161102142941.2769-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

List of fixed CVEs:

CVE-2016-8864

Release notes:

http://ftp.isc.org/isc/bind9/9.11.0-P1/RELEASE-NOTES-bind-9.11.0-P1.html

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index bc46604..3522149 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,2 +1,2 @@
-# Verified from ftp://ftp.isc.org/isc/bind9/9.11.0/bind-9.11.0.tar.gz.sha256.asc
-sha256 6f0b403036e0281b272a0fbdd0dc3417f3050b625cb059c5409432611418058b  bind-9.11.0.tar.gz
+# Verified from http://ftp.isc.org/isc/bind9/9.11.0-P1/bind-9.11.0-P1.tar.gz.sha256.asc
+sha256 094cd3134ba1b44f0910de1334f05a7dca68d583da038de40a8ad7a0cb1592c6  bind-9.11.0-P1.tar.gz
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 9b5d8c5..ee50acf 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.11.0
+BIND_VERSION = 9.11.0-P1
 BIND_SITE = ftp://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 # bind does not support parallel builds.
 BIND_MAKE = $(MAKE1)
-- 
2.10.1
