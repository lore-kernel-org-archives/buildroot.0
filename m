From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Dec 2012 00:40:05 -0800
Subject: [Buildroot] [git commit] ed: bump to version 1.7
Message-ID: <20121205091357.938BA8F555@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ea2df5659831325605a0735e8ea6e7ec6fb5dfe2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ed/ed.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/ed/ed.mk b/package/ed/ed.mk
index a97e19b..2bb8e0e 100644
--- a/package/ed/ed.mk
+++ b/package/ed/ed.mk
@@ -4,9 +4,11 @@
 #
 #############################################################
 
-ED_VERSION = 1.6
+ED_VERSION = 1.7
 ED_SITE = $(BR2_GNU_MIRROR)/ed
 ED_CONF_OPT = CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
 		LDFLAGS="$(TARGET_LDFLAGS)"
+ED_LICENSE = GPLv3+
+ED_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
