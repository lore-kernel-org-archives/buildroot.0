From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Jul 2014 23:52:50 +0200
Subject: [Buildroot] [git commit] musepack: add license information
Message-ID: <20140708222428.084089D1D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f1296ea133205d37dcb8ed47d85b7dc763f57707
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/musepack/musepack.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
