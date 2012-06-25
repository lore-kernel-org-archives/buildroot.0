From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 25 Jun 2012 07:00:28 +0300
Subject: [Buildroot] [PATCH 1/2] libpcap: bump to version 1.3.0
Message-ID: <b62717db24356f9761c48c7439ab757f0d32f3b7.1340596768.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libpcap/libpcap.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index 0b88a42..51e1106 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBPCAP_VERSION = 1.2.1
+LIBPCAP_VERSION = 1.3.0
 LIBPCAP_SITE = http://www.tcpdump.org/release
 LIBPCAP_INSTALL_STAGING = YES
 # doesn't have an install-strip
-- 
1.7.10
