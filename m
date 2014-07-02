From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  2 Jul 2014 09:40:06 -0300
Subject: [Buildroot] [PATCH 08/13] musepack: add license information
In-Reply-To: <1404304811-27480-1-git-send-email-gustavo@zacarias.com.ar>
References: <1404304811-27480-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1404304811-27480-8-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/musepack/musepack.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/musepack/musepack.mk b/package/musepack/musepack.mk
index ce2d17e..80bc26b 100644
--- a/package/musepack/musepack.mk
+++ b/package/musepack/musepack.mk
@@ -10,5 +10,7 @@ MUSEPACK_SOURCE = musepack_src_$(MUSEPACK_VERSION).tar.gz
 MUSEPACK_DEPENDENCIES = libcuefile libreplaygain
 MUSEPACK_INSTALL_STAGING = YES
 MUSEPACK_MAKE = $(MAKE1)
+MUSEPACK_LICENSE = BSD-3c (*mpcdec), LGPLv2.1+ (*mpcenc)
+MUSEPACK_LICENSE_FILES = libmpcdec/COPYING libmpcenc/quant.c
 
 $(eval $(cmake-package))
-- 
1.8.5.5
