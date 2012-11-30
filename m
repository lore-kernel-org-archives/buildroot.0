From: spdawson at gmail.com <spdawson@gmail.com>
Date: Fri, 30 Nov 2012 10:14:36 +0000
Subject: [Buildroot] [PATCH 1/8] acpid: add license information
In-Reply-To: <1354270483-32356-1-git-send-email-spdawson@gmail.com>
References: <1354270483-32356-1-git-send-email-spdawson@gmail.com>
Message-ID: <1354270483-32356-2-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <simond@trainfx.com>

Signed-off-by: Simon Dawson <simond@trainfx.com>
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
