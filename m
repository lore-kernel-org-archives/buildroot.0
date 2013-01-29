From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 29 Jan 2013 23:25:40 +0100
Subject: [Buildroot] [git commit] libungif: add license information
Message-ID: <20130129223113.193AF9A88E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=706a016b29f6fe11c996cd61ab5a8b66cbc6b5e1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libungif/libungif.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libungif/libungif.mk b/package/libungif/libungif.mk
index d4d281a..5196ccd 100644
--- a/package/libungif/libungif.mk
+++ b/package/libungif/libungif.mk
@@ -9,6 +9,8 @@ LIBUNGIF_SOURCE = libungif-$(LIBUNGIF_VERSION).tar.bz2
 LIBUNGIF_SITE = http://downloads.sourceforge.net/project/giflib/libungif-4.x/libungif-$(LIBUNGIF_VERSION)
 LIBUNGIF_INSTALL_STAGING = YES
 LIBUNGIF_CONF_OPT = --without-x
+LIBUNGIF_LICENSE = MIT
+LIBUNGIF_LICENSE_FILES = COPYING
 
 LIBUNGIF_BINS = gif2epsn gif2ps gif2rgb gif2x11 gifasm gifbg gifburst gifclip \
 		gifclrmp gifcolor gifcomb gifcompose giffiltr giffix gifflip  \
