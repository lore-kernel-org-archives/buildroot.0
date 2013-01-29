From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 29 Jan 2013 15:23:53 -0300
Subject: [Buildroot] [PATCH 04/10] gmpc: add license information
In-Reply-To: <1359483839-25357-1-git-send-email-gustavo@zacarias.com.ar>
References: <1359483839-25357-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1359483839-25357-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gmpc/gmpc.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gmpc/gmpc.mk b/package/gmpc/gmpc.mk
index 5f914ff..81e9f1f 100644
--- a/package/gmpc/gmpc.mk
+++ b/package/gmpc/gmpc.mk
@@ -8,6 +8,8 @@ GMPC_VERSION = 11.8.16
 GMPC_SITE = http://download.sarine.nl/Programs/gmpc/$(GMPC_VERSION)
 GMPC_CONF_ENV = ac_cv_path_GOB2=$(GOB2_HOST_BINARY)
 GMPC_CONF_OPT = --disable-mmkeys --disable-unique
+GMPC_LICENSE = GPLv2+
+GMPC_LICENSE_FILES = COPYING
 GMPC_DEPENDENCIES = host-gob2 host-intltool host-pkgconf host-vala \
 	libglib2 libgtk2 libmpd libsoup sqlite \
 	xlib_libICE xlib_libSM xlib_libX11 \
-- 
1.7.12.4
