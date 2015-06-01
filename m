From: Baruch Siach <baruch@tkos.co.il>
Date: Mon,  1 Jun 2015 21:11:11 +0300
Subject: [Buildroot] [PATCH 1/2] libpcap: bump to version 1.7.3
Message-ID: <52fd7f7ccf19bfe68e2919435d07ba0805671a47.1433182272.git.baruch@tkos.co.il>
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
index 967f2dd9b549..eea87d955c99 100644
--- a/package/libpcap/libpcap.hash
+++ b/package/libpcap/libpcap.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	1a4abc1f268b68f97e69a497f53695c9acc7a13f1d522a4d940dea276e6698ae	libpcap-1.7.2.tar.gz
+sha256	dd9f85213dc8e948068405b55dd20f8b32e3083e9e0e186f833bd0372e559e2f	libpcap-1.7.3.tar.gz
diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index 68d6614e4ef5..eb64641e5163 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPCAP_VERSION = 1.7.2
+LIBPCAP_VERSION = 1.7.3
 LIBPCAP_SITE = http://www.tcpdump.org/release
 LIBPCAP_LICENSE = BSD-3c
 LIBPCAP_LICENSE_FILES = LICENSE
-- 
2.1.4
