From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sat, 11 Aug 2012 16:10:15 -0400
Subject: [Buildroot] [PATCH 05/17] libcgicc: add license info
In-Reply-To: <1344715827-9452-1-git-send-email-danomimanchego123@gmail.com>
References: <1344715827-9452-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <1344715827-9452-5-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/libcgicc/libcgicc.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libcgicc/libcgicc.mk b/package/libcgicc/libcgicc.mk
index 98b8e5f..80e9213 100644
--- a/package/libcgicc/libcgicc.mk
+++ b/package/libcgicc/libcgicc.mk
@@ -6,6 +6,7 @@
 LIBCGICC_VERSION=3.2.9
 LIBCGICC_SITE=$(BR2_GNU_MIRROR)/cgicc
 LIBCGICC_SOURCE=cgicc-$(LIBCGICC_VERSION).tar.gz
+LIBCGICC_LICENSE=LGPLv3+
 LIBCGICC_INSTALL_STAGING=YES
 LIBCGICC_AUTORECONF=YES
 
-- 
1.7.9.5
