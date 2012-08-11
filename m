From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sat, 11 Aug 2012 16:10:19 -0400
Subject: [Buildroot] [PATCH 09/17] libgpg-error: add license info
In-Reply-To: <1344715827-9452-1-git-send-email-danomimanchego123@gmail.com>
References: <1344715827-9452-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <1344715827-9452-9-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/libgpg-error/libgpg-error.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index 96cbbd6..288165b 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -6,6 +6,8 @@
 
 LIBGPG_ERROR_VERSION = 1.10
 LIBGPG_ERROR_SITE = ftp://ftp.gnupg.org/gcrypt/libgpg-error
+LIBGPG_ERROR_LICENSE = LGPLv2.1+
+LIBGPG_ERROR_LICENSE_FILES = COPYING.LIB
 LIBGPG_ERROR_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
-- 
1.7.9.5
