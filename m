From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Jun 2013 21:41:25 +0200
Subject: [Buildroot] [git commit] libcap-ng: define license
Message-ID: <20130628195144.D2D4F9B290@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c211a53d3fc4b19a527c632091534ef822696228
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: license is LGPLv2.1+]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libcap-ng/libcap-ng.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libcap-ng/libcap-ng.mk b/package/libcap-ng/libcap-ng.mk
index d1c4462..97eb219 100644
--- a/package/libcap-ng/libcap-ng.mk
+++ b/package/libcap-ng/libcap-ng.mk
@@ -10,5 +10,7 @@ LIBCAP_NG_SOURCE = libcap-ng-$(LIBCAP_NG_VERSION).tar.gz
 LIBCAP_NG_INSTALL_STAGING = YES
 LIBCAP_NG_CONF_ENV = ac_cv_prog_swig_found=no
 LIBCAP_NG_CONF_OPT = --without-python
+LIBCAP_NG_LICENSE = GPLv2+ LGPLv2.1+
+LIBCAP_NG_LICENSE_FILES = COPYING COPYING.LIB
 
 $(eval $(autotools-package))
