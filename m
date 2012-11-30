From: spdawson at gmail.com <spdawson@gmail.com>
Date: Fri, 30 Nov 2012 10:14:40 +0000
Subject: [Buildroot] [PATCH 5/8] midori: add license information
In-Reply-To: <1354270483-32356-1-git-send-email-spdawson@gmail.com>
References: <1354270483-32356-1-git-send-email-spdawson@gmail.com>
Message-ID: <1354270483-32356-6-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <simond@trainfx.com>

Signed-off-by: Simon Dawson <simond@trainfx.com>
---
 package/midori/midori.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/midori/midori.mk b/package/midori/midori.mk
index 44cce40..8fac3d8 100644
--- a/package/midori/midori.mk
+++ b/package/midori/midori.mk
@@ -7,6 +7,8 @@
 MIDORI_VERSION = 0.4.6
 MIDORI_SOURCE = midori-$(MIDORI_VERSION).tar.bz2
 MIDORI_SITE = http://archive.xfce.org/src/apps/midori/0.4/
+MIDORI_LICENSE = LGPLv2.1+
+MIDORI_LICENSE_FILES = COPYING
 MIDORI_DEPENDENCIES = \
 	host-intltool \
 	host-pkgconf \
-- 
1.7.10.4
