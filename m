From: Mark Jackson <mpfj-list@mimc.co.uk>
Date: Wed, 12 Sep 2012 08:54:27 +0100
Subject: [Buildroot] [PATCH] dropbear: add license information
Message-ID: <50503FB3.6080807@mimc.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mark Jackson <mpfj@newflow.co.uk>
---
 package/dropbear/dropbear.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index 64d3a01..cd349b0 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -6,6 +6,8 @@

 DROPBEAR_VERSION = 2012.55
 DROPBEAR_SITE = http://matt.ucc.asn.au/dropbear/releases
+DROPBEAR_LICENSE = dropbear license
+DROPBEAR_LICENSE_FILES = LICENSE
 DROPBEAR_TARGET_BINS = dbclient dropbearkey dropbearconvert scp ssh
 DROPBEAR_MAKE =	$(MAKE) MULTI=1 SCPPROGRESS=1 \
 		PROGRAMS="dropbear dbclient dropbearkey dropbearconvert scp"
-- 
1.7.9.5
