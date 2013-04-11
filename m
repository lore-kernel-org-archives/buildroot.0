From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 11 Apr 2013 23:57:07 +0200
Subject: [Buildroot] [git commit] kismet: fix license files info
Message-ID: <20130411215658.5D90B9B59D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e968ebee7efb85d22a1953c032201c1d9982df20
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/9a0ebe157438a07e145026e61c3031e5bf2283b9

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/kismet/kismet.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index 845df6b..5abc92c 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -8,7 +8,7 @@ KISMET_VERSION = 2013-03-R1a
 KISMET_SITE = http://www.kismetwireless.net/code
 KISMET_DEPENDENCIES = host-pkgconf libpcap ncurses
 KISMET_LICENSE = GPLv2+
-KISMET_LICENSE_FILES = GPL
+KISMET_LICENSE_FILES = debian/copyright
 
 ifeq ($(BR2_PACKAGE_LIBNL),y)
 	KISMET_DEPENDENCIES += libnl
