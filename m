From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  1 Jun 2014 23:03:30 +0200
Subject: [Buildroot] [PATCH 06/26] package/tzdata: bump version for some new
	timezones
In-Reply-To: <cover.1401656581.git.yann.morin.1998@free.fr>
References: <cover.1401656581.git.yann.morin.1998@free.fr>
Message-ID: <65531c070eb1214153e3a95b1bf837898af67448.1401656581.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

A few adjustments here and there, plus re-definition
of the Crimea timezone.

New definition for the moment the Big-Bang occured, too. :-)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/tzdata/tzdata.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index 58b5f13..4f86289 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TZDATA_VERSION = 2014a
+TZDATA_VERSION = 2014d
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
 TZDATA_SITE = ftp://ftp.iana.org/tz/releases
 TZDATA_DEPENDENCIES = host-zic
-- 
1.8.3.2
