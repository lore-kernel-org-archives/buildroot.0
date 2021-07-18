From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 18 Jul 2021 10:04:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/libuci: add license files
Message-ID: <20210718080418.1536430-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libuci/libuci.hash | 2 ++
 package/libuci/libuci.mk   | 1 +
 2 files changed, 3 insertions(+)

diff --git a/package/libuci/libuci.hash b/package/libuci/libuci.hash
index b6962c2541..54bdb023aa 100644
--- a/package/libuci/libuci.hash
+++ b/package/libuci/libuci.hash
@@ -1,2 +1,4 @@
 # Locally computed
 sha256  76ef826df2961420cd7a4f1702bef06c37563d9807a2d8e84557963aab21ac80  libuci-52bbc99f69ea6f67b6fe264f424dac91bde5016c-br1.tar.gz
+sha256  53672dbbd32466fe6c7ad7cb35b54f666f3f1b41273cd3bd00a42054608aa512  cli.c
+sha256  69d4eea4de19d27014f3d6ed723081b4039700bfd73cd0a5e39e2c4f19a58c66  libuci.c
diff --git a/package/libuci/libuci.mk b/package/libuci/libuci.mk
index 0d0b78036e..4515e3f21c 100644
--- a/package/libuci/libuci.mk
+++ b/package/libuci/libuci.mk
@@ -8,6 +8,7 @@ LIBUCI_VERSION = 52bbc99f69ea6f67b6fe264f424dac91bde5016c
 LIBUCI_SITE = https://git.openwrt.org/project/uci.git
 LIBUCI_SITE_METHOD = git
 LIBUCI_LICENSE = LGPL-2.1, GPL-2.0 (tools)
+LIBUCI_LICENSE_FILES = cli.c libuci.c
 LIBUCI_CPE_ID_VENDOR = openwrt
 LIBUCI_INSTALL_STAGING = YES
 LIBUCI_DEPENDENCIES = libubox
-- 
2.30.2
