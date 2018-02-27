From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 26 Feb 2018 20:10:34 -0600
Subject: [Buildroot] [NEXT 19/26] libzlib: add CPE id
In-Reply-To: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1519697441-54194-20-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/libzlib/libzlib.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libzlib/libzlib.mk b/package/libzlib/libzlib.mk
index eea0c12..b94a1d7 100644
--- a/package/libzlib/libzlib.mk
+++ b/package/libzlib/libzlib.mk
@@ -11,6 +11,7 @@ LIBZLIB_LICENSE = Zlib
 LIBZLIB_LICENSE_FILES = README
 LIBZLIB_INSTALL_STAGING = YES
 LIBZLIB_PROVIDES = zlib
+LIBZLIB_CPE_ID = gnu:zlib:$(LIBZLIB_VERSION)
 
 # It is not possible to build only a shared version of zlib, so we build both
 # shared and static, unless we only want the static libs, and we eventually
-- 
1.9.1
