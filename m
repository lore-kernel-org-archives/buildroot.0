From: spdawson at gmail.com <spdawson@gmail.com>
Date: Fri,  9 Nov 2012 11:13:31 +0000
Subject: [Buildroot] [PATCH] acpid: add license information
Message-ID: <1352459611-14307-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/acpid/acpid.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/acpid/acpid.mk b/package/acpid/acpid.mk
index 56f671d..b024e94 100644
--- a/package/acpid/acpid.mk
+++ b/package/acpid/acpid.mk
@@ -6,6 +6,8 @@
 ACPID_VERSION = 2.0.11
 ACPID_SOURCE = acpid_$(ACPID_VERSION).orig.tar.gz
 ACPID_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/a/acpid
+ACPID_LICENSE = GPLv2
+ACPID_LICENSE_FILES = COPYING
 
 define ACPID_BUILD_CMDS
 	$(MAKE) CC="$(TARGET_CC)" -C $(@D)
-- 
1.7.10.4
