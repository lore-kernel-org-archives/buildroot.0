From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Mar 2014 21:15:00 +0100
Subject: [Buildroot] [git commit] package/tzdata: bump to latest version
	2014a
Message-ID: <20140315202727.89CB59BFE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6f4ba73eb64f6ea2d871c479c389ff6c4e6125e8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adds new definition for Turkish DST.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tzdata/tzdata.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index 1cb5b3f..d5c9f66 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TZDATA_VERSION = 2013i
+TZDATA_VERSION = 2014a
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
 TZDATA_SITE = ftp://ftp.iana.org/tz/releases
 TZDATA_DEPENDENCIES = host-zic
