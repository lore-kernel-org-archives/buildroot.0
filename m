From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 2 Nov 2012 23:51:02 +0100
Subject: [Buildroot] [git commit] dbus: bump version
Message-ID: <20121102231435.3A2EF999E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b72f3f625c97bca59549b3fedfd51b3dc993fb27
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes security issues:
- CVE-2012-3524: Don't access environment variables (fd.o #52202)
  Thanks to work and input from Colin Walters, Simon McVittie,
  Geoffrey Thomas, and others.

- Be more careful about monotonic time vs. real time, fixing
  DBUS_COOKIE_SHA1 spec-compliance (fd.o #48580, David Zeuthen)

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dbus/dbus.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index f848bfd..b7cc378 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -3,7 +3,7 @@
 # dbus
 #
 #############################################################
-DBUS_VERSION = 1.4.20
+DBUS_VERSION = 1.4.24
 DBUS_SITE = http://dbus.freedesktop.org/releases/dbus/
 DBUS_INSTALL_STAGING = YES
 
