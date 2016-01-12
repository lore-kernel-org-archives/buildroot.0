From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Jan 2016 22:59:10 +0100
Subject: [Buildroot] [git commit] package/tremor: bump to revision 19427
Message-ID: <20160112223529.DE9F582751@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0420114855f36aa6c38866878ce303b0ed95d887
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The revision 18153 dates from 2012-01-20. Lets update to latest changed revision
19427 which dates from 2015-01-07.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tremor/tremor.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tremor/tremor.mk b/package/tremor/tremor.mk
index 590a18c..97b0ce3 100644
--- a/package/tremor/tremor.mk
+++ b/package/tremor/tremor.mk
@@ -6,7 +6,7 @@
 
 TREMOR_SITE = http://svn.xiph.org/trunk/Tremor
 TREMOR_SITE_METHOD = svn
-TREMOR_VERSION = 18153
+TREMOR_VERSION = 19427
 TREMOR_LICENSE = BSD-3c
 TREMOR_LICENSE_FILES = COPYING
 
