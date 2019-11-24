From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 24 Nov 2019 10:34:46 +0100
Subject: [Buildroot] [PATCH 1/1] package/rtai: add license
Message-ID: <20191124093446.1023544-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rtai/rtai.hash | 1 +
 package/rtai/rtai.mk   | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/rtai/rtai.hash b/package/rtai/rtai.hash
index f0afafbd7c..1a3e97559b 100644
--- a/package/rtai/rtai.hash
+++ b/package/rtai/rtai.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 13669da744a0ba411bdb8e47fa47b6e19171646ae42c8dbb2735d12e555fb1a3 rtai-4.0.1.tar.bz2
+sha256 3590a0b20d24116a646bfefb0cd5abf5fdbc43c22f66df190d83aeb085beb169 rtai-lab/scilab5/RTAI/license.txt
diff --git a/package/rtai/rtai.mk b/package/rtai/rtai.mk
index 90f2cc4c8d..d6450c5550 100644
--- a/package/rtai/rtai.mk
+++ b/package/rtai/rtai.mk
@@ -7,6 +7,8 @@
 RTAI_VERSION = 4.0.1
 RTAI_SOURCE = rtai-$(RTAI_VERSION).tar.bz2
 RTAI_SITE = https://www.rtai.org/userfiles/downloads/RTAI
+RTAI_LICENSE = GPL-2.0+
+RTAI_LICENSE_FILES = rtai-lab/scilab5/RTAI/license.txt 
 RTAI_INSTALL_STAGING = YES
 
 # The <pkg>_CONFIG_SCRIPTS cannot apply here to the specificities of rtai-config
-- 
2.24.0
