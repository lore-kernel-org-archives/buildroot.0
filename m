From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 14 Jun 2014 08:58:41 -0300
Subject: [Buildroot] [PATCH] sg3_utils: bump to version 1.39
Message-ID: <1402747121-29395-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sg3_utils/sg3_utils.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sg3_utils/sg3_utils.mk b/package/sg3_utils/sg3_utils.mk
index 4a08fd5..5c56b6f 100644
--- a/package/sg3_utils/sg3_utils.mk
+++ b/package/sg3_utils/sg3_utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SG3_UTILS_VERSION = 1.38
+SG3_UTILS_VERSION = 1.39
 SG3_UTILS_SOURCE = sg3_utils-$(SG3_UTILS_VERSION).tar.xz
 SG3_UTILS_SITE  = http://sg.danny.cz/sg/p/
 SG3_UTILS_LICENSE = BSD-3c
@@ -26,7 +26,7 @@ define SG3_UTILS_REMOVE_PROGS
 		map sgm_dd modes opcodes sgp_dd persist prevent \
 		raw rbuf rdac read readcap read_block_limits \
 		read_buffer read_long reassign referrals \
-		requests reset rmsn rtpg safte sanitize \
+		rep_zones requests reset reset_wp rmsn rtpg safte sanitize \
 		sat_identify sat_phy_event sat_set_features scan \
 		senddiag ses start stpg sync test_rwbuf turs \
 		unmap verify vpd write_buffer write_long \
-- 
1.8.5.5
