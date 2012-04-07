From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 8 Apr 2012 00:16:34 +0200
Subject: [Buildroot] [git commit] libgtk2: bump version
Message-ID: <20120408062543.3575296A27@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c6a9a13d833eff9e48aea8c4bfcf4447d85b1c9d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libgtk2/libgtk2.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index a6abd07..b54743f 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 LIBGTK2_VERSION_MAJOR = 2.24
-LIBGTK2_VERSION_MINOR = 9
+LIBGTK2_VERSION_MINOR = 10
 LIBGTK2_VERSION = $(LIBGTK2_VERSION_MAJOR).$(LIBGTK2_VERSION_MINOR)
 
 LIBGTK2_SOURCE = gtk+-$(LIBGTK2_VERSION).tar.xz
