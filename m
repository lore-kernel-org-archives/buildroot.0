From: Sven Neumann <s.neumann@raumfeld.com>
Date: Fri,  5 Aug 2011 10:52:27 +0200
Subject: [Buildroot] [PATCH] libsoup: bump to 2.32.2
Message-ID: <1312534347-31403-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Buildroot should use a stable release, not use an unstable development
version. Updating to the current stable branch (2.34) is not trivial,
so at least use the latest release from the stable 2.32 branch.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
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
1.7.4.1
