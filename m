From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Jun 2014 15:55:15 -0300
Subject: [Buildroot] [PATCH 09/54] libgail: add license information
In-Reply-To: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403636160-11807-9-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libgail/libgail.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libgail/libgail.mk b/package/libgail/libgail.mk
index 3034b41..02b2735 100644
--- a/package/libgail/libgail.mk
+++ b/package/libgail/libgail.mk
@@ -10,6 +10,8 @@ LIBGAIL_SOURCE = gail-$(LIBGAIL_VERSION).tar.bz2
 LIBGAIL_SITE = http://ftp.gnome.org/pub/gnome/sources/gail/$(LIBGAIL_VERSION_MAJOR)
 LIBGAIL_AUTORECONF = YES
 LIBGAIL_INSTALL_STAGING = YES
+LIBGAIL_LICENSE = LGPLv2+
+LIBGAIL_LICENSE_FILES = COPYING
 
 ifneq ($(BR2_PACKAGE_XLIB_LIBX11),y)
 LIBGAIL_CONF_OPT += --disable-x
-- 
1.8.5.5
