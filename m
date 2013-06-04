From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Mon,  3 Jun 2013 22:03:30 -0400
Subject: [Buildroot] [PATCH 2/7] tiff: add license info
In-Reply-To: <1370311415-1966-1-git-send-email-danomimanchego123@gmail.com>
References: <1370311415-1966-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <1370311415-1966-2-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/tiff/tiff.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index e881647..bcc55be 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -6,6 +6,8 @@
 
 TIFF_VERSION = 4.0.3
 TIFF_SITE = http://download.osgeo.org/libtiff
+TIFF_LICENSE = tiff license
+TIFF_LICENSE_FILES = COPYRIGHT
 TIFF_INSTALL_STAGING = YES
 TIFF_CONF_OPT = \
 	--disable-cxx \
-- 
1.7.9.5
