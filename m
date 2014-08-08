From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 Aug 2014 22:19:20 +0200
Subject: [Buildroot] [git commit] dropbear: bump to version 2014.65
Message-ID: <20140808202158.1B8739D3A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b781001179690b037137b883c33dc2ba5ca85df1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes some regressions introduced by 2014.64

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dropbear/dropbear.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index afdc3c8..e8fcdf6 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DROPBEAR_VERSION = 2014.64
+DROPBEAR_VERSION = 2014.65
 DROPBEAR_SITE = http://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
 DROPBEAR_TARGET_BINS = dbclient dropbearkey dropbearconvert scp ssh
