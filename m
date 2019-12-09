From: Peter Seiderer <ps.report@gmx.net>
Date: Mon,  9 Dec 2019 21:04:52 +0100
Subject: [Buildroot] [PATCH v1 10/11] gstreamer1-editing-services: bump
 version to 1.16.2
In-Reply-To: <20191209200453.2461-1-ps.report@gmx.net>
References: <20191209200453.2461-1-ps.report@gmx.net>
Message-ID: <20191209200453.2461-10-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 .../gstreamer1-editing-services.hash                          | 4 ++--
 .../gstreamer1-editing-services.mk                            | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
index 2912ed1bc7..8724f39498 100644
--- a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
+++ b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
@@ -1,5 +1,5 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer-editing-services/gstreamer-editing-services-1.16.1.tar.xz.sha256sum
-sha256 c884878f9e6ddac96e4f174654d12fe52e3d48eaaec27a80767c0d56cb2f6780 gstreamer-editing-services-1.16.1.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer-editing-services/gstreamer-editing-services-1.16.2.tar.xz.sha256sum
+sha256 0e06a6191a0c6c16e16272bf2573cecaeb245f10629486ad940a299bef700c16 gstreamer-editing-services-1.16.2.tar.xz
 
 # Hashes for license files:
 sha256 f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a COPYING
diff --git a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
index 51e411ba81..e2bb747d0a 100644
--- a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
+++ b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_EDITING_SERVICES_VERSION = 1.16.1
+GSTREAMER1_EDITING_SERVICES_VERSION = 1.16.2
 GSTREAMER1_EDITING_SERVICES_SOURCE = gstreamer-editing-services-$(GSTREAMER1_EDITING_SERVICES_VERSION).tar.xz
 GSTREAMER1_EDITING_SERVICES_SITE = http://gstreamer.freedesktop.org/src/gstreamer-editing-services
 GSTREAMER1_EDITING_SERVICES_LICENSE = LGPL-2.0+
-- 
2.24.0
