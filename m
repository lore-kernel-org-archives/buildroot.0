From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 16 Dec 2009 16:29:02 +0100
Subject: [Buildroot] [git commit master] dbus-glib: fix host-dbus-glib build
Message-ID: <20091216153103.586A077738@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=19fb4b9d1b23334732e5bc6a9e9db818290bcbf8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Typo in expat dependency.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dbus-glib/dbus-glib.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dbus-glib/dbus-glib.mk b/package/dbus-glib/dbus-glib.mk
index 0bf2b3f..302d1b1 100644
--- a/package/dbus-glib/dbus-glib.mk
+++ b/package/dbus-glib/dbus-glib.mk
@@ -25,7 +25,7 @@ DBUS_GLIB_CONF_OPT = --localstatedir=/var \
 
 DBUS_GLIB_DEPENDENCIES = host-pkg-config dbus host-dbus host-dbus-glib libglib2 expat
 
-HOST_DBUS_GLIB_DEPENDENCIES = host-dbus host-exapt host-libglib2
+HOST_DBUS_GLIB_DEPENDENCIES = host-dbus host-expat host-libglib2
 
 HOST_DBUS_GLIB_CONF_OPT = \
 		--disable-tests \
-- 
1.6.3.3
