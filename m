From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Apr 2018 19:56:29 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] libfcgi: Use SPDX license
 identifier
Message-ID: <20180407175148.6AD1F87BDD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=462d5d5244909760d348020e3d4cf0433ad953f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

The fcgi license is covered by SPDX, the identifier however is not
obvious.

For details, see https://spdx.org/licenses/OML.html

[Peter: add spdx.org link]
Signed-off-by: Alexander Dahl <post@lespocky.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

(cherry picked from commit b13d9ab380704ba4faf1e0295885797cb3341336)
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
