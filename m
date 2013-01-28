From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 28 Jan 2013 08:42:30 +0100
Subject: [Buildroot] [git commit] libvncserver: bump version
Message-ID: <20130128074236.13A589A836@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eed556c7feae527b59bb48b88737d77c3ca8a333
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libvncserver/libvncserver.mk |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libvncserver/libvncserver.mk b/package/libvncserver/libvncserver.mk
index ac55a95..011b174 100644
--- a/package/libvncserver/libvncserver.mk
+++ b/package/libvncserver/libvncserver.mk
@@ -4,10 +4,11 @@
 #
 #############################################################
 
-LIBVNCSERVER_VERSION = 0.9.8.2
+LIBVNCSERVER_VERSION = 0.9.9
 LIBVNCSERVER_SOURCE = LibVNCServer-$(LIBVNCSERVER_VERSION).tar.gz
 LIBVNCSERVER_SITE = http://downloads.sourceforge.net/project/libvncserver/libvncserver/$(LIBVNCSERVER_VERSION)
-
+LIBVNCSERVER_LICENSE = GPLv2+
+LIBVNCSERVER_LICENSE_FILES = COPYING
 LIBVNCSERVER_INSTALL_STAGING = YES
 
 # only used for examples
