From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Jun 2014 22:42:52 +0200
Subject: [Buildroot] [git commit] libglade: add license information
Message-ID: <20140625211213.C926D9D0C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c3ffd01e68c87dbd41601592e418d058c340e1bb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libglade/libglade.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libglade/libglade.mk b/package/libglade/libglade.mk
index e197122..b29d4e5 100644
--- a/package/libglade/libglade.mk
+++ b/package/libglade/libglade.mk
@@ -10,6 +10,8 @@ LIBGLADE_SOURCE = libglade-$(LIBGLADE_VERSION).tar.bz2
 LIBGLADE_SITE = http://ftp.gnome.org/pub/GNOME/sources/libglade/$(LIBGLADE_VERSION_MAJOR)/
 LIBGLADE_INSTALL_STAGING = YES
 LIBGLADE_DEPENDENCIES = host-pkgconf libglib2 libgtk2 atk libxml2
+LIBGLADE_LICENSE = LGPLV2+
+LIBGLADE_LICENSE_FILES = COPYING
 
 define LIBGLADE_INSTALL_FIX
 	rm -rf $(TARGET_DIR)/usr/share/xml/libglade \
