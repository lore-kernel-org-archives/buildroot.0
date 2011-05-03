From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 3 May 2011 14:07:16 +0200
Subject: [Buildroot] [git commit] libglade: bump version
Message-ID: <20110503124040.7DBFF82BDF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=743208349966f76748a8017ffc394ad531825e20
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libglade/libglade.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libglade/libglade.mk b/package/libglade/libglade.mk
index 67e621b..df62039 100644
--- a/package/libglade/libglade.mk
+++ b/package/libglade/libglade.mk
@@ -3,7 +3,7 @@
 # libglade
 #
 #############################################################
-LIBGLADE_VERSION = 2.6.3
+LIBGLADE_VERSION = 2.6.4
 LIBGLADE_SOURCE = libglade-$(LIBGLADE_VERSION).tar.bz2
 LIBGLADE_SITE = http://ftp.gnome.org/pub/GNOME/sources/libglade/2.6/
 LIBGLADE_INSTALL_STAGING = YES
-- 
1.7.3.4
