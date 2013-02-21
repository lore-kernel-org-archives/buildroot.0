From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Thu, 21 Feb 2013 15:58:43 +0100
Subject: [Buildroot] [PATCH 13/13] Install libfribidi to staging
In-Reply-To: <cover.1361458625.git.maxime.hadjinlian@gmail.com>
References: <cover.1361458625.git.maxime.hadjinlian@gmail.com>
Message-ID: <ba6371a6ed52c760f18dbf14b662f6310b29f776.1361458625.git.maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Install libfribi to staging to be able to link against it.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/libfribidi/libfribidi.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libfribidi/libfribidi.mk b/package/libfribidi/libfribidi.mk
index 538997c..45568ca 100644
--- a/package/libfribidi/libfribidi.mk
+++ b/package/libfribidi/libfribidi.mk
@@ -9,5 +9,6 @@ LIBFRIBIDI_SOURCE = fribidi-$(LIBFRIBIDI_VERSION).tar.bz2
 LIBFRIBIDI_SITE = http://www.fribidi.org/download/
 LIBFRIBIDI_LICENSE = LGPLv2.1+
 LIBFRIBIDI_LICENSE_FILES = COPYING
+LIBFRIBIDI_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
-- 
1.7.10.4
