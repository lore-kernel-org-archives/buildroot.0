From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 30 Nov 2012 14:28:13 -0800
Subject: [Buildroot] [git commit] fluxbox: add license info
Message-ID: <20121130223214.6B776820F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c788354145b5c10a993c1c9afb2905fa64ce5e96
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/fluxbox/fluxbox.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/fluxbox/fluxbox.mk b/package/fluxbox/fluxbox.mk
index 15136c9..356c5a2 100644
--- a/package/fluxbox/fluxbox.mk
+++ b/package/fluxbox/fluxbox.mk
@@ -7,6 +7,8 @@
 FLUXBOX_VERSION = 1.3.2
 FLUXBOX_SOURCE = fluxbox-$(FLUXBOX_VERSION).tar.bz2
 FLUXBOX_SITE = http://downloads.sourceforge.net/project/fluxbox/fluxbox/$(FLUXBOX_VERSION)
+FLUXBOX_LICENSE = MIT
+FLUXBOX_LICENSE_FILES = COPYING
 
 FLUXBOX_CONF_OPT = --x-includes=$(STAGING_DIR)/usr/include/X11 \
 		   --x-libraries=$(STAGING_DIR)/usr/lib
