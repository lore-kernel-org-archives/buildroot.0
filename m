From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Mar 2016 22:54:07 +0100
Subject: [Buildroot] [git commit] pango: bump to version 1.40.0
Message-ID: <20160324215416.D39C680789@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1f3100f80616b71bea5143ed6645a049b921cac9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pango/pango.hash | 4 ++--
 package/pango/pango.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/pango/pango.hash b/package/pango/pango.hash
index 792ac05..132e458 100644
--- a/package/pango/pango.hash
+++ b/package/pango/pango.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/pango/1.36/pango-1.38.1.sha256sum
-sha256	1320569f6c6d75d6b66172b2d28e59c56ee864ee9df202b76799c4506a214eb7	pango-1.38.1.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/pango/1.36/pango-1.40.0.sha256sum
+sha256	da17985df314cb07d066ab5424f59c21ce973ece05b7de4df04d798ec8511c8b	pango-1.40.0.tar.xz
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index a6b1a60..a3639dc 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PANGO_VERSION_MAJOR = 1.38
-PANGO_VERSION = $(PANGO_VERSION_MAJOR).1
+PANGO_VERSION_MAJOR = 1.40
+PANGO_VERSION = $(PANGO_VERSION_MAJOR).0
 PANGO_SOURCE = pango-$(PANGO_VERSION).tar.xz
 PANGO_SITE = http://ftp.gnome.org/pub/GNOME/sources/pango/$(PANGO_VERSION_MAJOR)
 PANGO_AUTORECONF = YES
