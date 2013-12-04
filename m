From: Axel Lin <axel.lin@ingics.com>
Date: Wed, 04 Dec 2013 11:28:43 +0800
Subject: [Buildroot] [PATCH] wireshark: bump to version 1.10.3
Message-ID: <1386127723.8545.1.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The current stable release of Wireshark is 1.10.3. It supersedes all previous
releases. So let's upgrade to 1.10.3.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/wireshark/wireshark.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 9f968fd..ecd414f 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 1.8.11
+WIRESHARK_VERSION = 1.10.3
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.bz2
 WIRESHARK_SITE = http://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
-- 
1.8.1.2
