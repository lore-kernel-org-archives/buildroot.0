From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sun, 19 Aug 2012 16:18:24 -0400
Subject: [Buildroot] [PATCH 2/8] alsa-utils: add license info
In-Reply-To: <1345407510-10058-1-git-send-email-danomimanchego123@gmail.com>
References: <1345407510-10058-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <1345407510-10058-2-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/multimedia/alsa-utils/alsa-utils.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/multimedia/alsa-utils/alsa-utils.mk b/package/multimedia/alsa-utils/alsa-utils.mk
index 90fba51..7043837 100644
--- a/package/multimedia/alsa-utils/alsa-utils.mk
+++ b/package/multimedia/alsa-utils/alsa-utils.mk
@@ -7,6 +7,8 @@
 ALSA_UTILS_VERSION = 1.0.25
 ALSA_UTILS_SOURCE = alsa-utils-$(ALSA_UTILS_VERSION).tar.bz2
 ALSA_UTILS_SITE = ftp://ftp.alsa-project.org/pub/utils
+ALSA_UTILS_LICENSE = GPLv2
+ALSA_UTILS_LICENSE_FILES = COPYING
 ALSA_UTILS_INSTALL_STAGING = YES
 ALSA_UTILS_DEPENDENCIES = alsa-lib \
 	$(if $(BR2_PACKAGE_NCURSES),ncurses)
-- 
1.7.9.5
