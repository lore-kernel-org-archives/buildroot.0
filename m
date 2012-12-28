From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Dec 2012 20:41:57 +0100
Subject: [Buildroot] [PATCH 04/20] efl/libedje: bump to version 1.7.4
In-Reply-To: <cover.1356723702.git.thomas.petazzoni@free-electrons.com>
References: <cover.1356723702.git.thomas.petazzoni@free-electrons.com>
Message-ID: <8b45650519a7cc75d538983c65af3be06d37f6cf.1356723702.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efl/libedje/libedje.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/efl/libedje/libedje.mk b/package/efl/libedje/libedje.mk
index ce17da5..a02eaa9 100644
--- a/package/efl/libedje/libedje.mk
+++ b/package/efl/libedje/libedje.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBEDJE_VERSION = 1.1.0
+LIBEDJE_VERSION = 1.7.4
 LIBEDJE_SOURCE = edje-$(LIBEDJE_VERSION).tar.bz2
 LIBEDJE_SITE =  http://download.enlightenment.org/releases/
 LIBEDJE_LICENSE = GPLv2+ (epp binary), BSD-2c (everything else)
-- 
1.7.9.5
