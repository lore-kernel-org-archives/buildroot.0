From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Jun 2014 15:55:16 -0300
Subject: [Buildroot] [PATCH 10/54] libglade: add license information
In-Reply-To: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403636160-11807-10-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libglade/libglade.mk | 2 ++
 1 file changed, 2 insertions(+)

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
-- 
1.8.5.5
