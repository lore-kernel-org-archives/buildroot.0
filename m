From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Dec 2012 20:41:58 +0100
Subject: [Buildroot] [PATCH 05/20] efl/libeet: bump to version 1.7.4
In-Reply-To: <cover.1356723702.git.thomas.petazzoni@free-electrons.com>
References: <cover.1356723702.git.thomas.petazzoni@free-electrons.com>
Message-ID: <cac9cd6a565c0bb4103f56e62ff5fab1ada71c2b.1356723702.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efl/libeet/libeet.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/efl/libeet/libeet.mk b/package/efl/libeet/libeet.mk
index ccb3501..a5a1ce1 100644
--- a/package/efl/libeet/libeet.mk
+++ b/package/efl/libeet/libeet.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBEET_VERSION = 1.5.0
+LIBEET_VERSION = 1.7.4
 LIBEET_SOURCE = eet-$(LIBEET_VERSION).tar.bz2
 LIBEET_SITE = http://download.enlightenment.org/releases/
 LIBEET_LICENSE = BSD-2c
-- 
1.7.9.5
