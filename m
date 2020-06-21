From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Jun 2020 12:37:59 +0200
Subject: [Buildroot] [PATCH 16/23] package/kodi-pvr-octonet: add kodi as
 dependency
In-Reply-To: <20200621103806.616133-1-bernd.kuhls@t-online.de>
References: <20200621103806.616133-1-bernd.kuhls@t-online.de>
Message-ID: <20200621103806.616133-16-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed by upstream:
https://github.com/DigitalDevices/pvr.octonet/blob/Leia/CMakeLists.txt#L6

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-octonet/kodi-pvr-octonet.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kodi-pvr-octonet/kodi-pvr-octonet.mk b/package/kodi-pvr-octonet/kodi-pvr-octonet.mk
index 890a283565..9f8ddb8955 100644
--- a/package/kodi-pvr-octonet/kodi-pvr-octonet.mk
+++ b/package/kodi-pvr-octonet/kodi-pvr-octonet.mk
@@ -8,6 +8,6 @@ KODI_PVR_OCTONET_VERSION = e35cc373476a92aee11ec8e8a14fb8fc086a4f84
 KODI_PVR_OCTONET_SITE = $(call github,DigitalDevices,pvr.octonet,$(KODI_PVR_OCTONET_VERSION))
 KODI_PVR_OCTONET_LICENSE = GPL-2.0+
 KODI_PVR_OCTONET_LICENSE_FILES = debian/copyright
-KODI_PVR_OCTONET_DEPENDENCIES = json-for-modern-cpp kodi-platform libplatform
+KODI_PVR_OCTONET_DEPENDENCIES = json-for-modern-cpp kodi kodi-platform libplatform
 
 $(eval $(cmake-package))
-- 
2.26.2
