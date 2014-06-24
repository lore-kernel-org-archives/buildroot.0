From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Jun 2014 15:55:17 -0300
Subject: [Buildroot] [PATCH 11/54] libgtk2: add license information
In-Reply-To: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403636160-11807-11-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libgtk2/libgtk2.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index cadca63..2ba9469 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -11,6 +11,8 @@ LIBGTK2_SOURCE = gtk+-$(LIBGTK2_VERSION).tar.xz
 LIBGTK2_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK2_VERSION_MAJOR)
 LIBGTK2_INSTALL_STAGING = YES
 LIBGTK2_INSTALL_TARGET = YES
+LIBGTK2_LICENSE = LGPLv2+
+LIBGTK2_LICENSE_FILES = COPYING
 
 LIBGTK2_AUTORECONF = YES
 
-- 
1.8.5.5
