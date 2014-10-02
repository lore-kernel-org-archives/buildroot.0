From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Oct 2014 12:17:45 +0200
Subject: [Buildroot] [git commit] libglade: fix license information
Message-ID: <20141002101758.2DCC19D319@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b354417dcef5805adb33cb2e3249d7c7be64cac7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libglade/libglade.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libglade/libglade.mk b/package/libglade/libglade.mk
index 55b586c..7bec938 100644
--- a/package/libglade/libglade.mk
+++ b/package/libglade/libglade.mk
@@ -10,7 +10,7 @@ LIBGLADE_SOURCE = libglade-$(LIBGLADE_VERSION).tar.bz2
 LIBGLADE_SITE = http://ftp.gnome.org/pub/GNOME/sources/libglade/$(LIBGLADE_VERSION_MAJOR)
 LIBGLADE_INSTALL_STAGING = YES
 LIBGLADE_DEPENDENCIES = host-pkgconf libglib2 libgtk2 atk libxml2
-LIBGLADE_LICENSE = LGPLV2+
+LIBGLADE_LICENSE = LGPLv2+
 LIBGLADE_LICENSE_FILES = COPYING
 
 define LIBGLADE_INSTALL_FIX
