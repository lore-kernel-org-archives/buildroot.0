From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Mar 2017 22:50:15 +0200
Subject: [Buildroot] [git commit] taglib: fix legal info
Message-ID: <20170326205041.F002A818A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f30a3940c8dc5fc9bbe3a0ace457201808142183
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

taglib is dual licensed under LGPLv2.1 or MPLv1.1. Almost all source
files have license text mentioning LGPLv2.1 or alternatively MPLv1.1.

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
[Thomas: use MPL-1.1 instead of MPLv1.1, since MPL-1.1 is the SPDX
license code for this license.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/taglib/taglib.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/taglib/taglib.mk b/package/taglib/taglib.mk
index f47c4ba..58bb889 100644
--- a/package/taglib/taglib.mk
+++ b/package/taglib/taglib.mk
@@ -7,7 +7,7 @@
 TAGLIB_VERSION = 1.11.1
 TAGLIB_SITE = http://taglib.github.io/releases
 TAGLIB_INSTALL_STAGING = YES
-TAGLIB_LICENSE = LGPLv2.1, MPL
+TAGLIB_LICENSE = LGPLv2.1 or MPL-1.1
 TAGLIB_LICENSE_FILES = COPYING.LGPL COPYING.MPL
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
