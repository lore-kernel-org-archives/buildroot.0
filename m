From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jun 2016 15:06:16 +0200
Subject: [Buildroot] [git commit] gsettings-desktop-schemas: needs
	host-intltool
Message-ID: <20160611130625.4E5CA7FAC6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9252721e8d1ee27b129da0b0f9f1444616698be4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/ec2/ec2c1035d6823adde6de4f7bfaf5e3a59223ae4a/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gsettings-desktop-schemas/gsettings-desktop-schemas.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gsettings-desktop-schemas/gsettings-desktop-schemas.mk b/package/gsettings-desktop-schemas/gsettings-desktop-schemas.mk
index a8910b1..04ad2e0 100644
--- a/package/gsettings-desktop-schemas/gsettings-desktop-schemas.mk
+++ b/package/gsettings-desktop-schemas/gsettings-desktop-schemas.mk
@@ -9,7 +9,7 @@ GSETTINGS_DESKTOP_SCHEMAS_VERSION = $(GSETTINGS_DESKTOP_SCHEMAS_VERSION_MAJOR).0
 GSETTINGS_DESKTOP_SCHEMAS_SOURCE = gsettings-desktop-schemas-$(GSETTINGS_DESKTOP_SCHEMAS_VERSION).tar.xz
 GSETTINGS_DESKTOP_SCHEMAS_SITE = http://ftp.gnome.org/pub/gnome/sources/gsettings-desktop-schemas/$(GSETTINGS_DESKTOP_SCHEMAS_VERSION_MAJOR)
 GSETTINGS_DESKTOP_SCHEMAS_INSTALL_STAGING = YES
-GSETTINGS_DESKTOP_SCHEMAS_DEPENDENCIES = host-pkgconf libglib2
+GSETTINGS_DESKTOP_SCHEMAS_DEPENDENCIES = host-intltool host-pkgconf libglib2
 GSETTINGS_DESKTOP_SCHEMAS_LICENSE = LGPLv2.1+
 GSETTINGS_DESKTOP_SCHEMAS_LICENSE_FILES = COPYING
 
