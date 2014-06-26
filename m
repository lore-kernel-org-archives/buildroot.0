From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jun 2014 16:21:01 -0300
Subject: [Buildroot] [PATCH 33/53] libmms: add license information
In-Reply-To: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403810481-10025-33-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libmms/libmms.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmms/libmms.mk b/package/libmms/libmms.mk
index 405729f..445da7f 100644
--- a/package/libmms/libmms.mk
+++ b/package/libmms/libmms.mk
@@ -6,9 +6,9 @@
 
 LIBMMS_VERSION = 0.6.2
 LIBMMS_SITE = http://downloads.sourceforge.net/project/libmms/libmms/$(LIBMMS_VERSION)
-
 LIBMMS_INSTALL_STAGING = YES
-
 LIBMMS_DEPENDENCIES = host-pkgconf libglib2
+LIBMMS_LICENSE = LGPLv2.1
+LIBMMS_LICENSE_FILES = COPYING.LIB
 
 $(eval $(autotools-package))
-- 
1.8.5.5
