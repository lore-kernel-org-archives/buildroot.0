From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 21 Jan 2013 18:29:49 -0300
Subject: [Buildroot] [PATCH 09/10] libvorbis: add license information
In-Reply-To: <1358803790-30245-1-git-send-email-gustavo@zacarias.com.ar>
References: <1358803790-30245-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1358803790-30245-9-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libvorbis/libvorbis.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libvorbis/libvorbis.mk b/package/libvorbis/libvorbis.mk
index c8ff213..ace8147 100644
--- a/package/libvorbis/libvorbis.mk
+++ b/package/libvorbis/libvorbis.mk
@@ -8,9 +8,9 @@ LIBVORBIS_VERSION = 1.3.3
 LIBVORBIS_SOURCE = libvorbis-$(LIBVORBIS_VERSION).tar.gz
 LIBVORBIS_SITE = http://downloads.xiph.org/releases/vorbis/$(LIBVORBIS-SOURCE)
 LIBVORBIS_INSTALL_STAGING = YES
-
 LIBVORBIS_CONF_OPT = --disable-oggtest
-
 LIBVORBIS_DEPENDENCIES = host-pkgconf libogg
+LIBVORBIS_LICENSE = BSD-3c
+LIBVORBIS_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
-- 
1.7.12.4
