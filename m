From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 21 Jul 2009 16:30:32 +0200
Subject: [Buildroot] [git commit] libglib2: update to upstream release 2.20.4
Message-ID: <20090722060606.56D927781D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d4d7c7911a116297e4807a70694f6e9a9deddf23
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libglib2/libglib2.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 75f0cfc..b2738b0 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 LIBGLIB2_VERSION_MAJOR = 2.20
-LIBGLIB2_VERSION_MINOR = 1
+LIBGLIB2_VERSION_MINOR = 4
 LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).$(LIBGLIB2_VERSION_MINOR)
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.bz2
 LIBGLIB2_SITE = http://ftp.gtk.org/pub/glib/$(LIBGLIB2_VERSION_MAJOR)
-- 
1.6.3.3
