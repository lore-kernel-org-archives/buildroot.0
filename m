From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Apr 2018 21:04:36 +0200
Subject: [Buildroot] [git commit] gstreamer1-editing-services: use SPDX
 short identifier for license
Message-ID: <20180405190756.025D285EF2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e85961f41560a8c5c1043d6cba9430b943184882
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../gstreamer1-editing-services/gstreamer1-editing-services.mk          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
index a126ac471c..9b5a93eb75 100644
--- a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
+++ b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
@@ -7,7 +7,7 @@
 GSTREAMER1_EDITING_SERVICES_VERSION = 1.12.4
 GSTREAMER1_EDITING_SERVICES_SOURCE = gstreamer-editing-services-$(GSTREAMER1_EDITING_SERVICES_VERSION).tar.xz
 GSTREAMER1_EDITING_SERVICES_SITE = http://gstreamer.freedesktop.org/src/gstreamer-editing-services
-GSTREAMER1_EDITING_SERVICES_LICENSE = LGPLv2+
+GSTREAMER1_EDITING_SERVICES_LICENSE = LGPL-2.0+
 GSTREAMER1_EDITING_SERVICES_LICENSE_FILES = COPYING COPYING.LIB
 GSTREAMER1_EDITING_SERVICES_INSTALL_STAGING = YES
 GSTREAMER1_EDITING_SERVICES_DEPENDENCIES = \
