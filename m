From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sat, 11 Aug 2012 16:10:20 -0400
Subject: [Buildroot] [PATCH 10/17] libpcap: add license info
In-Reply-To: <1344715827-9452-1-git-send-email-danomimanchego123@gmail.com>
References: <1344715827-9452-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <1344715827-9452-10-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/libpcap/libpcap.mk |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index 1d1fbc1..04766ea 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -6,7 +6,10 @@
 
 LIBPCAP_VERSION = 1.3.0
 LIBPCAP_SITE = http://www.tcpdump.org/release
+LIBPCAP_LICENSE = BSD-3c
+LIBPCAP_LICENSE_FILES = LICENSE
 LIBPCAP_INSTALL_STAGING = YES
+
 # doesn't have an install-strip
 LIBPCAP_INSTALL_TARGET_OPT= DESTDIR="$(TARGET_DIR)" \
 	$(if $(BR2_PREFER_STATIC_LIB),install,install-shared)
-- 
1.7.9.5
