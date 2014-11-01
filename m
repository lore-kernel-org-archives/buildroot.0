From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Nov 2014 15:03:53 +0100
Subject: [Buildroot] [git commit] pango: bump to 1.36.7
Message-ID: <20141101140727.44A1BB5A4B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8d6be874cbe0a0824b6bf55511fa79c9d45372a5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump pango to version 1.36.7.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pango/pango.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 46490c1..6e340f4 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PANGO_VERSION_MAJOR = 1.36
-PANGO_VERSION = $(PANGO_VERSION_MAJOR).3
+PANGO_VERSION = $(PANGO_VERSION_MAJOR).7
 PANGO_SOURCE = pango-$(PANGO_VERSION).tar.xz
 PANGO_SITE = http://ftp.gnome.org/pub/GNOME/sources/pango/$(PANGO_VERSION_MAJOR)
 PANGO_AUTORECONF = YES
