From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 22 Jul 2014 10:12:38 +0300
Subject: [Buildroot] [PATCH 2/2] tcpdump: bump to version 4.6.1
In-Reply-To: <46a58b09ff51a083dd3e81a338bbfc3bda11eb7e.1406013158.git.baruch@tkos.co.il>
References: <46a58b09ff51a083dd3e81a338bbfc3bda11eb7e.1406013158.git.baruch@tkos.co.il>
Message-ID: <c42fdd091c6d150467c1c933cae2c29058d94beb.1406013158.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/tcpdump/tcpdump.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tcpdump/tcpdump.mk b/package/tcpdump/tcpdump.mk
index 0f4cebb41282..ade0136ee9b0 100644
--- a/package/tcpdump/tcpdump.mk
+++ b/package/tcpdump/tcpdump.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TCPDUMP_VERSION = 4.5.1
+TCPDUMP_VERSION = 4.6.1
 TCPDUMP_SITE = http://www.tcpdump.org/release
 TCPDUMP_LICENSE = BSD-3c
 TCPDUMP_LICENSE_FILES = LICENSE
-- 
2.0.1
