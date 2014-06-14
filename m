From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Jun 2014 18:38:28 +0200
Subject: [Buildroot] [git commit] sg3_utils: bump to version 1.39
Message-ID: <20140614163955.B7DB29CBEE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=85a2cd8672c4aad325f106d76a8c489432dc9dd4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sg3_utils/sg3_utils.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
