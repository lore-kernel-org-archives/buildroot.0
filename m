From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  9 May 2013 17:51:05 +0200
Subject: [Buildroot] [PATCH 10/12] libdrm: add license informations
In-Reply-To: <1368114667-14476-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1368114667-14476-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1368114667-14476-11-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libdrm/libdrm.mk |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 5dd276f..380bc1d 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -3,9 +3,12 @@
 # libdrm
 #
 #############################################################
+
 LIBDRM_VERSION = 2.4.38
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 LIBDRM_SITE = http://dri.freedesktop.org/libdrm/
+LIBDRM_LICENSE = MIT
+
 LIBDRM_INSTALL_STAGING = YES
 
 LIBDRM_DEPENDENCIES = \
-- 
1.7.9.5
