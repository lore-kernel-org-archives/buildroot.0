From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Dec 2012 20:42:02 +0100
Subject: [Buildroot] [PATCH 09/20] efl/libembryo: bump to version 1.7.4
In-Reply-To: <cover.1356723702.git.thomas.petazzoni@free-electrons.com>
References: <cover.1356723702.git.thomas.petazzoni@free-electrons.com>
Message-ID: <7b84f01fd0fc512db3e4d32e4255b15b3bd199e4.1356723702.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efl/libembryo/libembryo.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/efl/libembryo/libembryo.mk b/package/efl/libembryo/libembryo.mk
index 9cab5aa..ce5c968 100644
--- a/package/efl/libembryo/libembryo.mk
+++ b/package/efl/libembryo/libembryo.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBEMBRYO_VERSION = 1.1.0
+LIBEMBRYO_VERSION = 1.7.4
 LIBEMBRYO_SOURCE = embryo-$(LIBEMBRYO_VERSION).tar.bz2
 LIBEMBRYO_SITE = http://download.enlightenment.org/releases/
 LIBEMBRYO_LICENSE = BSD-2c, Embryo license
-- 
1.7.9.5
