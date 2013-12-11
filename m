From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 11 Dec 2013 10:23:41 -0300
Subject: [Buildroot] [PATCH 08/16] libdvdnav: add licensing info
In-Reply-To: <1386768229-29485-1-git-send-email-gustavo@zacarias.com.ar>
References: <1386768229-29485-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1386768229-29485-8-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libdvdnav/libdvdnav.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libdvdnav/libdvdnav.mk b/package/libdvdnav/libdvdnav.mk
index 9a29d6d..befcd8b 100644
--- a/package/libdvdnav/libdvdnav.mk
+++ b/package/libdvdnav/libdvdnav.mk
@@ -11,6 +11,8 @@ LIBDVDNAV_AUTORECONF = YES
 LIBDVDNAV_INSTALL_STAGING = YES
 LIBDVDNAV_CONFIG_SCRIPTS = dvdnav-config
 LIBDVDNAV_DEPENDENCIES = libdvdread host-pkgconf
+LIBDVDNAV_LICENSE = GPLv2+
+LIBDVDNAV_LICENSE_FILES = COPYING
 
 # By default libdvdnav tries to find dvdread-config in $PATH. Because
 # of cross compilation, we prefer using pkg-config.
-- 
1.8.3.2
