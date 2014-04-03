From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  3 Apr 2014 21:01:05 +0200
Subject: [Buildroot] [PATCH v4 10/37] taglib: version bump 1.9.1
In-Reply-To: <1396551692-12371-1-git-send-email-bernd.kuhls@t-online.de>
References: <1396551692-12371-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1396551692-12371-11-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/taglib/taglib.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/taglib/taglib.mk b/package/taglib/taglib.mk
index c04c88b..8e6a3bd 100644
--- a/package/taglib/taglib.mk
+++ b/package/taglib/taglib.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-TAGLIB_VERSION = 1.8
-TAGLIB_SITE = http://github.com/downloads/taglib/taglib
+TAGLIB_VERSION = 1.9.1
+TAGLIB_SITE = http://taglib.github.io/releases
 TAGLIB_INSTALL_STAGING = YES
 TAGLIB_LICENSE = LGPLv2.1 MPL
 TAGLIB_LICENSE_FILES = COPYING.LGPL COPYING.MPL
-- 
1.7.10.4
