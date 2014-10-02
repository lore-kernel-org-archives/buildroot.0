From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu,  2 Oct 2014 12:11:03 +0200
Subject: [Buildroot] [PATCH 3/3] libglade: fix license information
In-Reply-To: <1412244663-23868-1-git-send-email-luca@lucaceresoli.net>
References: <1412244663-23868-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1412244663-23868-3-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/libglade/libglade.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
1.9.1
