From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 6 Aug 2011 08:18:19 +0200
Subject: [Buildroot] [git commit] libsoup: bump to 2.32.2
Message-ID: <20110806062301.1112F8B775@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=59377dd2b5873012eb2470b284735cb6bf6e5ce7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot should use a stable release, not use an unstable development
version. Updating to the current stable branch (2.34) is not trivial,
so at least use the latest release from the stable 2.32 branch.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libsoup/libsoup.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index 6ec0882..11bfadd 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBSOUP_MAJOR_VERSION:=2.31
+LIBSOUP_MAJOR_VERSION:=2.32
 LIBSOUP_VERSION:=$(LIBSOUP_MAJOR_VERSION).2
 LIBSOUP_SOURCE:=libsoup-$(LIBSOUP_VERSION).tar.bz2
 LIBSOUP_SITE:=http://ftp.gnome.org/pub/gnome/sources/libsoup/$(LIBSOUP_MAJOR_VERSION)
-- 
1.7.3.4
