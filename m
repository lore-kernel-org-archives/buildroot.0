From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Oct 2013 08:38:26 +0200
Subject: [Buildroot] [git commit] pppd: add license information
Message-ID: <20131004063838.862079B92C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=47c463fe50aa48985bf2b2438637e373ddc4622d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pppd/pppd.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index b2ced29..471a71e 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -7,6 +7,10 @@
 PPPD_VERSION = 2.4.5
 PPPD_SOURCE = ppp-$(PPPD_VERSION).tar.gz
 PPPD_SITE = ftp://ftp.samba.org/pub/ppp
+PPPD_LICENSE = LGPLv2+ LGPL BSD-4c BSD-3c GPLv2+
+PPPD_LICENSE_FILES = pppd/tdb.c pppd/plugins/pppoatm/COPYING \
+	pppdump/bsd-comp.c pppd/ccp.c pppd/plugins/passprompt.c
+
 PPPD_TARGET_BINS = chat pppd pppdump pppstats
 PPPD_MANPAGES = $(if $(BR2_HAVE_DOCUMENTATION),chat pppd pppdump pppstats)
 PPPD_RADIUS_MANPAGES = $(if $(BR2_HAVE_DOCUMENTATION),pppd-radattr pppd-radius)
