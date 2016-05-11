From: Roland Franke <fli4l@franke-prem.de>
Date: Wed, 11 May 2016 16:23:37 +0200
Subject: [Buildroot] [PATCH v2 2/2] rrdtool: bump version to 1.6.0
In-Reply-To: <1462976617-24524-1-git-send-email-fli4l@franke-prem.de>
References: <1462976617-24524-1-git-send-email-fli4l@franke-prem.de>
Message-ID: <1462976617-24524-2-git-send-email-fli4l@franke-prem.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

disable autoreconf and gettextize as this is without the already
deleted patch delete patch 0001-Add-configure-option-to-disable-documentation.patch
not longer need.

Signed-off-by: Roland Franke <fli4l@franke-prem.de>
---
 package/rrdtool/rrdtool.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/rrdtool/rrdtool.mk b/package/rrdtool/rrdtool.mk
index f3c7451..39bb10a 100644
--- a/package/rrdtool/rrdtool.mk
+++ b/package/rrdtool/rrdtool.mk
@@ -9,8 +9,6 @@ RRDTOOL_SITE = http://oss.oetiker.ch/rrdtool/pub
 RRDTOOL_LICENSE = GPLv2+ with FLOSS license exceptions as explained in COPYRIGHT
 RRDTOOL_LICENSE_FILES = COPYRIGHT LICENSE
 RRDTOOL_DEPENDENCIES = host-pkgconf libglib2
-RRDTOOL_AUTORECONF = YES
-RRDTOOL_GETTEXTIZE = YES
 RRDTOOL_INSTALL_STAGING = YES
 RRDTOOL_CONF_OPTS = \
 	--disable-examples \
-- 
1.9.1
