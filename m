From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 22:02:06 +0100
Subject: [Buildroot] [git commit] liboping: comma separate licenses
Message-ID: <20151215210843.AC10C80409@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=17f3f340796b069c83780bd6bfe81581fbb02d81
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/liboping/liboping.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/liboping/liboping.mk b/package/liboping/liboping.mk
index aeaaa8a..94de73c 100644
--- a/package/liboping/liboping.mk
+++ b/package/liboping/liboping.mk
@@ -9,7 +9,7 @@ LIBOPING_SITE = http://noping.cc/files
 LIBOPING_INSTALL_STAGING = YES
 LIBOPING_DEPENDENCIES = $(if $(BR2_PACKAGE_NCURSES),ncurses)
 LIBOPING_CONF_OPTS = --without-perl-bindings
-LIBOPING_LICENSE = LGPLv2.1+ GPLv2
+LIBOPING_LICENSE = LGPLv2.1+, GPLv2
 LIBOPING_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
