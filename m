From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 20 Sep 2013 10:50:56 +0200
Subject: [Buildroot] [git commit] bc: needs host-flex
Message-ID: <20130920085051.3FBC29B7E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ff343ff80657090af537e90a31d52e59ea8ac67c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/49d/49d78f0528c6ecc2adfcfa17f4b09ec225c594be/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/bc/bc.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/bc/bc.mk b/package/bc/bc.mk
index 3f1f7e7..293b80d 100644
--- a/package/bc/bc.mk
+++ b/package/bc/bc.mk
@@ -6,6 +6,7 @@
 
 BC_VERSION = 1.06
 BC_SITE = $(BR2_GNU_MIRROR)/bc/
+BC_DEPENDENCIES = host-flex
 BC_LICENSE = GPLv2+ LGPLv2.1+
 BC_LICENSE_FILES = COPYING COPYING.LIB
 
