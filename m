From: aduskett at gmail.com <aduskett@gmail.com>
Date: Thu, 23 Apr 2020 10:40:05 -0700
Subject: [Buildroot] [PATCH 1/1] package/systemd: bump version to v245.5
Message-ID: <20200423174005.292532-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/systemd/systemd.hash | 2 +-
 package/systemd/systemd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index eacb797ed4..ea67a0ef7f 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256	bd1c467045989ab986b29d003f17960ccb201bc923093db978b4cfb299ae8a63	systemd-245.4.tar.gz
+sha256	b754d75617665a53bd0a1e8f5ec526b383f17e1cc06d1056399e5859e0b6fe06	systemd-245.5.tar.gz
 sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6	LICENSE.GPL2
 sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	LICENSE.LGPL2.1
 sha256	f7299f5f5e8bdffd347dce1bed888b1cea6ddaf27de521c307265098bcbeae92	README
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 296d975a7f..b45a70b7ad 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSTEMD_VERSION = 245.4
+SYSTEMD_VERSION = 245.5
 SYSTEMD_SITE = $(call github,systemd,systemd-stable,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = LGPL-2.1+, GPL-2.0+ (udev), Public Domain (few source files, see README), BSD-3-Clause (tools/chromiumos)
 SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README tools/chromiumos/LICENSE
-- 
2.25.3
