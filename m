From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 15:33:50 +0200
Subject: [Buildroot] [git commit] freeswitch: use SPDX short identifier for
	license strings
Message-ID: <20170401134426.4210B82623@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=69b13a252e8e70bbf5b5884365184d9b1a6387d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
