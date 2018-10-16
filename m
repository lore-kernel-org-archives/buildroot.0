From: Francois Gerin <francois.gerin@essensium.com>
Date: Tue, 16 Oct 2018 14:31:08 +0200
Subject: [Buildroot] [PATCH] qt download site update
In-Reply-To: <adb6fd85-75d3-30e9-df67-a358d07338b0@essensium.com>
References: <adb6fd85-75d3-30e9-df67-a358d07338b0@essensium.com>
Message-ID: <7adc37ba-4418-471e-7d4b-fae12a4312f1@essensium.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The download link was broken, former qt versions are stored into a
distinct location.

Signed-off-by: Francois Gerin <francois.gerin@essensium.com>
---
 ?package/qt/qt.mk | 2 +-
 ?1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 921ff13d29..23cb94c11f 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -7,7 +7,7 @@
 ?QT_VERSION_MAJOR = 4.8
 ?QT_VERSION = $(QT_VERSION_MAJOR).7
 ?QT_SOURCE = qt-everywhere-opensource-src-$(QT_VERSION).tar.gz
-QT_SITE = 
http://download.qt-project.org/official_releases/qt/$(QT_VERSION_MAJOR)/$(QT_VERSION)
+QT_SITE = 
http://download.qt.io/archive/qt/$(QT_VERSION_MAJOR)/$(QT_VERSION)
 ?QT_DEPENDENCIES = host-pkgconf
 ?QT_INSTALL_STAGING = YES

-- 
2.11.0
