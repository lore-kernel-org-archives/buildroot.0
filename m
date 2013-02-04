From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 5 Feb 2013 00:01:41 +0100
Subject: [Buildroot] [git commit] liboping: add license information
Message-ID: <20130204230725.AB9A49A94B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d780f83a5a882af066e865119e2697b5754ad69a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/liboping/liboping.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/liboping/liboping.mk b/package/liboping/liboping.mk
index e253fbd..d852ef9 100644
--- a/package/liboping/liboping.mk
+++ b/package/liboping/liboping.mk
@@ -9,5 +9,7 @@ LIBOPING_SITE = http://verplant.org/liboping/files
 LIBOPING_INSTALL_STAGING = YES
 LIBOPING_DEPENDENCIES = $(if $(BR2_PACKAGE_NCURSES),ncurses)
 LIBOPING_CONF_OPT = --without-perl-bindings
+LIBOPING_LICENSE = LGPLv2.1+ GPLv2
+LIBOPING_LICENSE_FILES = COPYING.LIB
 
 $(eval $(autotools-package))
