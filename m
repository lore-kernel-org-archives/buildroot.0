From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Jun 2014 08:36:57 +0200
Subject: [Buildroot] [git commit] package/tzdata: bump version for some new
	timezones
Message-ID: <20140602064038.F17EA9CE56@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7a237567f943bff22b0d8547f835a2ff48c2b792
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A few adjustments here and there, plus re-definition
of the Crimea timezone.

New definition for the moment the Big-Bang occured, too. :-)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tzdata/tzdata.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index b619851..47e29c0 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TZDATA_VERSION = 2014a
+TZDATA_VERSION = 2014d
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
 TZDATA_SITE = ftp://ftp.iana.org/tz/releases
 TZDATA_DEPENDENCIES = host-tzdata
