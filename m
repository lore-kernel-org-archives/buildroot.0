From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Aug 2018 00:00:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/bind: security bump to version
 9.11.4-P1
Message-ID: <20180818220013.7733-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2018-5740: https://ftp.isc.org/isc/bind9/9.11.4-P1/CHANGES

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 78f8015521..6e8c186e2d 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.11.4/bind-9.11.4.tar.gz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.11.4-P1/bind-9.11.4-P1.tar.gz.asc
 # with key BE0E9748B718253A28BB89FFF1B11BF05CF02E57
-sha256 595070b031f869f8939656b5a5d11b121211967f15f6afeafa895df745279617 bind-9.11.4.tar.gz
+sha256 b0e0dc3c8bf26989b1cad53f90d44a48e39404afc68f65c45bae79b446f0fe23 bind-9.11.4-P1.tar.gz
 sha256 336f3c40e37a1a13690efb4c63e20908faa4c40498cc02f3579fb67d3a1933a5 COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index d478a7f6e1..0140041218 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.11.4
+BIND_VERSION = 9.11.4-P1
 BIND_SITE = http://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 # bind does not support parallel builds.
 BIND_MAKE = $(MAKE1)
-- 
2.18.0
