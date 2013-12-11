From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Dec 2013 22:23:03 +0100
Subject: [Buildroot] [git commit] libreplaygain: add licensing info
Message-ID: <20131211213614.D22139BFD0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f29e5768ca3ba67346ee27d879722226b6fb3aba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libreplaygain/libreplaygain.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libreplaygain/libreplaygain.mk b/package/libreplaygain/libreplaygain.mk
index 8818e16..05074fc 100644
--- a/package/libreplaygain/libreplaygain.mk
+++ b/package/libreplaygain/libreplaygain.mk
@@ -10,5 +10,7 @@ LIBREPLAYGAIN_SOURCE = libreplaygain_$(LIBREPLAYGAIN_VERSION).tar.gz
 # upstream doesn't ship configure
 LIBREPLAYGAIN_AUTORECONF = YES
 LIBREPLAYGAIN_INSTALL_STAGING = YES
+LIBREPLAYGAIN_LICENSE = LGPLv2.1+
+LIBREPLAYGAIN_LICENSE_FILES = src/gain_analysis.c
 
 $(eval $(autotools-package))
