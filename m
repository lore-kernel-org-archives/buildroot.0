From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Mar 2018 10:51:13 +0200
Subject: [Buildroot] [git commit] libfcgi: Use SPDX license identifier
Message-ID: <20180326085211.B6BE283BFA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b13d9ab380704ba4faf1e0295885797cb3341336
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The fcgi license is covered by SPDX, the identifier however is not
obvious.

For details, see https://spdx.org/licenses/OML.html

[Peter: add spdx.org link]
Signed-off-by: Alexander Dahl <post@lespocky.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libfcgi/libfcgi.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libfcgi/libfcgi.mk b/package/libfcgi/libfcgi.mk
index ced850c153..78da772916 100644
--- a/package/libfcgi/libfcgi.mk
+++ b/package/libfcgi/libfcgi.mk
@@ -7,7 +7,7 @@
 LIBFCGI_VERSION = 2.4.0
 LIBFCGI_SOURCE = fcgi-$(LIBFCGI_VERSION).tar.gz
 LIBFCGI_SITE = http://www.fastcgi.com/dist
-LIBFCGI_LICENSE = fcgi license
+LIBFCGI_LICENSE = OML
 LIBFCGI_LICENSE_FILES = LICENSE.TERMS
 LIBFCGI_INSTALL_STAGING = YES
 LIBFCGI_AUTORECONF = YES
