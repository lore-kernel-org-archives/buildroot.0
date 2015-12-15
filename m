From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 22:04:49 +0100
Subject: [Buildroot] [git commit] taglib: comma separate licenses
Message-ID: <20151215210845.1F36B80409@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fd493457b339bbb1d7e94cdb4be1add2790db7eb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/taglib/taglib.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/taglib/taglib.mk b/package/taglib/taglib.mk
index ed08874..2410650 100644
--- a/package/taglib/taglib.mk
+++ b/package/taglib/taglib.mk
@@ -7,7 +7,7 @@
 TAGLIB_VERSION = 1.9.1
 TAGLIB_SITE = http://taglib.github.io/releases
 TAGLIB_INSTALL_STAGING = YES
-TAGLIB_LICENSE = LGPLv2.1 MPL
+TAGLIB_LICENSE = LGPLv2.1, MPL
 TAGLIB_LICENSE_FILES = COPYING.LGPL COPYING.MPL
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
