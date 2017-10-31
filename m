From: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Date: Tue, 31 Oct 2017 09:16:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/dash: drop the default value of the
	DASH_SOURCE variable
Message-ID: <1509437772-19274-1-git-send-email-jerzy.m.grzegorek@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
---
 package/dash/dash.mk   | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index 72ef722..c8b4164 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 DASH_VERSION = 0.5.9.1
-DASH_SOURCE = dash-$(DASH_VERSION).tar.gz
 DASH_SITE = http://gondor.apana.org.au/~herbert/dash/files
 DASH_LICENSE = BSD-3-Clause, GPL-2.0+ (mksignames.c)
 DASH_LICENSE_FILES = COPYING
-- 
1.9.1
