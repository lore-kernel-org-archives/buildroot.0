From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Jun 2014 22:40:05 +0200
Subject: [Buildroot] [git commit] libart: add license information
Message-ID: <20140625211213.B75B59D0C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d6095a43a8dbbd2a8299e24fe63335d045844d14
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libart/libart.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libart/libart.mk b/package/libart/libart.mk
index 39c72cc..a103f23 100644
--- a/package/libart/libart.mk
+++ b/package/libart/libart.mk
@@ -11,5 +11,7 @@ LIBART_SITE = http://ftp.gnome.org/pub/gnome/sources/libart_lgpl/$(LIBART_VERSIO
 LIBART_AUTORECONF = YES
 LIBART_INSTALL_STAGING = YES
 LIBART_CONFIG_SCRIPTS = libart2-config
+LIBART_LICENSE = LGPLv2+
+LIBART_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
