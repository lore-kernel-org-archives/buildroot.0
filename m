From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Jul 2010 16:46:12 +0200
Subject: [Buildroot] [PATCH 03/16] pango: bump to 1.28
In-Reply-To: <cover.1280241791.git.thomas.petazzoni@free-electrons.com>
References: <cover.1280241791.git.thomas.petazzoni@free-electrons.com>
Message-ID: <da480c796150558aa66ba683f89070e55a353488.1280241791.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/pango/pango.mk |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index ad38246..875c0bc 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -3,9 +3,12 @@
 # pango
 #
 #############################################################
-PANGO_VERSION = 1.20.5
+PANGO_VERSION_MAJOR = 1.28
+PANGO_VERSION_MINOR = 0
+PANGO_VERSION = $(PANGO_VERSION_MAJOR).$(PANGO_VERSION_MINOR)
+
 PANGO_SOURCE = pango-$(PANGO_VERSION).tar.bz2
-PANGO_SITE = http://ftp.gnome.org/pub/GNOME/sources/pango/1.20
+PANGO_SITE = http://ftp.gnome.org/pub/GNOME/sources/pango/$(PANGO_VERSION_MAJOR)
 PANGO_AUTORECONF = YES
 PANGO_INSTALL_STAGING = YES
 PANGO_INSTALL_TARGET = YES
-- 
1.7.0.4
