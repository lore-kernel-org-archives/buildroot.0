From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sat, 11 Aug 2012 16:10:13 -0400
Subject: [Buildroot] [PATCH 03/17] libfcgi: add license info
In-Reply-To: <1344715827-9452-1-git-send-email-danomimanchego123@gmail.com>
References: <1344715827-9452-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <1344715827-9452-3-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/libfcgi/libfcgi.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libfcgi/libfcgi.mk b/package/libfcgi/libfcgi.mk
index 1aa2c5a..a4d18a4 100644
--- a/package/libfcgi/libfcgi.mk
+++ b/package/libfcgi/libfcgi.mk
@@ -6,6 +6,8 @@
 LIBFCGI_VERSION = 2.4.0
 LIBFCGI_SOURCE = fcgi-$(LIBFCGI_VERSION).tar.gz
 LIBFCGI_SITE = http://www.fastcgi.com/dist
+LIBFCGI_LICENSE = fcgi license
+LIBFCGI_LICENSE_FILES = LICENSE.TERMS
 LIBFCGI_INSTALL_STAGING = YES
 LIBFCGI_AUTORECONF = YES
 
-- 
1.7.9.5
