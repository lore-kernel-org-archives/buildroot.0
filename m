From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 13 Jul 2015 17:53:38 +0300
Subject: [Buildroot] [PATCH] libpcap: bump to version 1.7.4
Message-ID: <fec6981b51d4de3b973462eaa37cbec61207d735.1436799218.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libpcap/libpcap.hash | 2 +-
 package/libpcap/libpcap.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libpcap/libpcap.hash b/package/libpcap/libpcap.hash
index eea87d955c99..5ce53673b803 100644
--- a/package/libpcap/libpcap.hash
+++ b/package/libpcap/libpcap.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	dd9f85213dc8e948068405b55dd20f8b32e3083e9e0e186f833bd0372e559e2f	libpcap-1.7.3.tar.gz
+sha256	7ad3112187e88328b85e46dce7a9b949632af18ee74d97ffc3f2b41fe7f448b0	libpcap-1.7.4.tar.gz
diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index eb64641e5163..eb21fa97979d 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPCAP_VERSION = 1.7.3
+LIBPCAP_VERSION = 1.7.4
 LIBPCAP_SITE = http://www.tcpdump.org/release
 LIBPCAP_LICENSE = BSD-3c
 LIBPCAP_LICENSE_FILES = LICENSE
-- 
2.1.4
