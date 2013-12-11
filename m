From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Dec 2013 22:24:02 +0100
Subject: [Buildroot] [git commit] libexif: add licensing info
Message-ID: <20131211213615.06E459A383@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b3da05b899aa758a66f7eecc422c3ff676a2465b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libexif/libexif.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libexif/libexif.mk b/package/libexif/libexif.mk
index a1d4475..b59243a 100644
--- a/package/libexif/libexif.mk
+++ b/package/libexif/libexif.mk
@@ -10,5 +10,7 @@ LIBEXIF_SITE = http://downloads.sourceforge.net/project/libexif/libexif/$(LIBEXI
 LIBEXIF_INSTALL_STAGING = YES
 LIBEXIF_CONF_OPT = --disable-docs
 LIBEXIF_DEPENDENCIES = host-pkgconf
+LIBEXIF_LICENSE = LGPLv2.1+
+LIBEXIF_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
