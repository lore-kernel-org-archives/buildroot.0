From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 29 Jan 2013 15:23:56 -0300
Subject: [Buildroot] [PATCH 07/10] libungif: add license information
In-Reply-To: <1359483839-25357-1-git-send-email-gustavo@zacarias.com.ar>
References: <1359483839-25357-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1359483839-25357-7-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libungif/libungif.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libungif/libungif.mk b/package/libungif/libungif.mk
index d4d281a..5196ccd 100644
--- a/package/libungif/libungif.mk
+++ b/package/libungif/libungif.mk
@@ -9,6 +9,8 @@ LIBUNGIF_SOURCE = libungif-$(LIBUNGIF_VERSION).tar.bz2
 LIBUNGIF_SITE = http://downloads.sourceforge.net/project/giflib/libungif-4.x/libungif-$(LIBUNGIF_VERSION)
 LIBUNGIF_INSTALL_STAGING = YES
 LIBUNGIF_CONF_OPT = --without-x
+LIBUNGIF_LICENSE = MIT
+LIBUNGIF_LICENSE_FILES = COPYING
 
 LIBUNGIF_BINS = gif2epsn gif2ps gif2rgb gif2x11 gifasm gifbg gifburst gifclip \
 		gifclrmp gifcolor gifcomb gifcompose giffiltr giffix gifflip  \
-- 
1.7.12.4
