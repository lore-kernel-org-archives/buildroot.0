From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  9 Oct 2014 18:10:47 +0200
Subject: [Buildroot] [PATCH 4/5] libgeotiff: add license informations
In-Reply-To: <1412871048-28981-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1412871048-28981-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1412871048-28981-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
It would be good to get some independent review of the license
information, since it's not really clear how to encode the license
details provided in the LICENSE file into the LIBGEOTIFF_LICENSE
variable.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libgeotiff/libgeotiff.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libgeotiff/libgeotiff.mk b/package/libgeotiff/libgeotiff.mk
index 61f5c21..2bb0941 100644
--- a/package/libgeotiff/libgeotiff.mk
+++ b/package/libgeotiff/libgeotiff.mk
@@ -6,6 +6,8 @@
 
 LIBGEOTIFF_VERSION = 1.4.0
 LIBGEOTIFF_SITE = http://download.osgeo.org/geotiff/libgeotiff
+LIBGEOTIFF_LICENSE = X-style, public domain
+LIBGEOTIFF_LICENSE_FILES = LICENSE
 LIBGEOTIFF_DEPENDENCIES = tiff host-pkgconf
 LIBGEOTIFF_INSTALL_STAGING = YES
 LIBGEOTIFF_AUTORECONF = YES
-- 
2.0.0
