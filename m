From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Thu, 30 Mar 2017 19:13:44 +0530
Subject: [Buildroot] [PATCH 15/21] freeswitch: use SPDX short identifier for
	license strings
In-Reply-To: <1490881430-10434-1-git-send-email-rahulbedarkar89@gmail.com>
References: <1490881430-10434-1-git-send-email-rahulbedarkar89@gmail.com>
Message-ID: <1490881430-10434-16-git-send-email-rahulbedarkar89@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
---
 package/freeswitch/freeswitch.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 32439b8..0ce67f0 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -8,11 +8,11 @@ FREESWITCH_VERSION = 1.6.15
 FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).tar.xz
 FREESWITCH_SITE = http://files.freeswitch.org/freeswitch-releases
 FREESWITCH_LICENSE = MPL-1.1, \
-	GPLv3+ with font exception (fonts), \
+	GPL-3.0+ with font exception (fonts), \
 	Apache-2.0 (apr, apr-util), \
-	LGPLv2+ (sofia-sip), \
-	LGPLv2.1, GPLv2 (spandsp), \
-	BSD-3c (libsrtp), \
+	LGPL-2.0+ (sofia-sip), \
+	LGPL-2.1, GPL-2.0 (spandsp), \
+	BSD-3-Clause (libsrtp), \
 	tiff license
 
 FREESWITCH_LICENSE_FILES = \
-- 
2.6.2
