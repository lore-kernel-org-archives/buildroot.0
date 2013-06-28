From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 28 Jun 2013 10:41:10 -0300
Subject: [Buildroot] [PATCH 13/19] libcap-ng: define license
In-Reply-To: <1372426876-2258-1-git-send-email-gustavo@zacarias.com.ar>
References: <1372426876-2258-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1372426876-2258-13-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libcap-ng/libcap-ng.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libcap-ng/libcap-ng.mk b/package/libcap-ng/libcap-ng.mk
index d1c4462..630089b 100644
--- a/package/libcap-ng/libcap-ng.mk
+++ b/package/libcap-ng/libcap-ng.mk
@@ -10,5 +10,7 @@ LIBCAP_NG_SOURCE = libcap-ng-$(LIBCAP_NG_VERSION).tar.gz
 LIBCAP_NG_INSTALL_STAGING = YES
 LIBCAP_NG_CONF_ENV = ac_cv_prog_swig_found=no
 LIBCAP_NG_CONF_OPT = --without-python
+LIBCAP_NG_LICENSE = GPLv2+ LGPLv2+
+LIBCAP_NG_LICENSE_FILES = COPYING COPYING.LIB
 
 $(eval $(autotools-package))
-- 
1.8.1.5
