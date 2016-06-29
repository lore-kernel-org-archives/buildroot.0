From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 29 Jun 2016 12:58:32 +0200
Subject: [Buildroot] [git commit] package/tegrarcm: fix license typo
Message-ID: <20160629110030.3ACD98212C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ce83df3928121f1efedb975a6abdfa44c31946ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tegrarcm/tegrarcm.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tegrarcm/tegrarcm.mk b/package/tegrarcm/tegrarcm.mk
index 6f03b57..06fd039 100644
--- a/package/tegrarcm/tegrarcm.mk
+++ b/package/tegrarcm/tegrarcm.mk
@@ -7,7 +7,7 @@
 TEGRARCM_VERSION = v1.7
 TEGRARCM_SITE = $(call github,NVIDIA,tegrarcm,$(TEGRARCM_VERSION))
 TEGRARCM_LICENSE = BSD-3c / NVIDIA Software License (src/miniloader)
-TEGRARCM_LICENSE_FILE = LICENSE
+TEGRARCM_LICENSE_FILES = LICENSE
 TEGRARCM_AUTORECONF = YES
 HOST_TEGRARCM_DEPENDENCIES = host-libusb host-pkgconf host-cryptopp
 
