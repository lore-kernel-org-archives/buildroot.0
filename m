From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 5 Feb 2013 08:45:02 +0100
Subject: [Buildroot] [git commit] liboping: fix legal-info
Message-ID: <20130205074742.D56BD9A95E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=94e04800b2bf063628a261f803781de91cbfc791
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.org/results/c0bfc03389382235782474b278ca4afd1d283d60

The included (LGPL) license file is called COPYING.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/liboping/liboping.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/liboping/liboping.mk b/package/liboping/liboping.mk
index d852ef9..3198b71 100644
--- a/package/liboping/liboping.mk
+++ b/package/liboping/liboping.mk
@@ -10,6 +10,6 @@ LIBOPING_INSTALL_STAGING = YES
 LIBOPING_DEPENDENCIES = $(if $(BR2_PACKAGE_NCURSES),ncurses)
 LIBOPING_CONF_OPT = --without-perl-bindings
 LIBOPING_LICENSE = LGPLv2.1+ GPLv2
-LIBOPING_LICENSE_FILES = COPYING.LIB
+LIBOPING_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
