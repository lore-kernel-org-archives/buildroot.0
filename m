From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 22 Jul 2014 10:12:37 +0300
Subject: [Buildroot] [PATCH 1/2] libpcap: bump to version 1.6.1
Message-ID: <46a58b09ff51a083dd3e81a338bbfc3bda11eb7e.1406013158.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libpcap/libpcap.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index 10b6cea0292d..a8c056ea3d82 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPCAP_VERSION = 1.5.3
+LIBPCAP_VERSION = 1.6.1
 LIBPCAP_SITE = http://www.tcpdump.org/release
 LIBPCAP_LICENSE = BSD-3c
 LIBPCAP_LICENSE_FILES = LICENSE
-- 
2.0.1
