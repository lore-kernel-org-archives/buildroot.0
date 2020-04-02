From: aduskett at gmail.com <aduskett@gmail.com>
Date: Wed,  1 Apr 2020 18:12:23 -0700
Subject: [Buildroot] [PATCH 1/1] package/systemd: bump version to 245.4
Message-ID: <20200402011224.725831-1-aduskett@gmail.com>
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
index 4a398ef6bb..eacb797ed4 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256	6dc956a857c889d6f3cf7d768d4836db48a39e5bef5dd930fbed697ab2421a61	systemd-245.tar.gz
+sha256	bd1c467045989ab986b29d003f17960ccb201bc923093db978b4cfb299ae8a63	systemd-245.4.tar.gz
 sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6	LICENSE.GPL2
 sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	LICENSE.LGPL2.1
 sha256	f7299f5f5e8bdffd347dce1bed888b1cea6ddaf27de521c307265098bcbeae92	README
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 56459947c4..0a4a84e7e2 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSTEMD_VERSION = 245
+SYSTEMD_VERSION = 245.4
 SYSTEMD_SITE = $(call github,systemd,systemd-stable,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = LGPL-2.1+, GPL-2.0+ (udev), Public Domain (few source files, see README), BSD-3-Clause (tools/chromiumos)
 SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README tools/chromiumos/LICENSE
-- 
2.25.1
