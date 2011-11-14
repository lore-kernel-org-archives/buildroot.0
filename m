From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 Nov 2011 14:29:57 +0100
Subject: [Buildroot] [git commit] distcc: fix upstream url
Message-ID: <20111114133054.EF5898F50A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0a93b0f4185071962b206392a5e202f4811f4dfa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Old upstream URL was no longer valid. While we're at it, fix a few
whitespace issues.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/distcc/distcc.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/distcc/distcc.mk b/package/distcc/distcc.mk
index 4096197..dc3b36b 100644
--- a/package/distcc/distcc.mk
+++ b/package/distcc/distcc.mk
@@ -3,9 +3,9 @@
 # distcc
 #
 #############################################################
-DISTCC_VERSION:=2.18.3
-DISTCC_SOURCE:=distcc-$(DISTCC_VERSION).tar.bz2
-DISTCC_SITE:=http://distcc.samba.org/ftp/distcc/
+DISTCC_VERSION = 2.18.3
+DISTCC_SOURCE = distcc-$(DISTCC_VERSION).tar.bz2
+DISTCC_SITE = http://distcc.googlecode.com/files/
 
 DISTCC_CONF_OPT = --with-included-popt --without-gtk --without-gnome
 
