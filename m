From: aduskett at gmail.com <aduskett@gmail.com>
Date: Tue, 25 Feb 2020 14:56:51 -0800
Subject: [Buildroot] [PATCH 1/1] package/systemd: bump version to 244.3
Message-ID: <20200225225651.548205-1-aduskett@gmail.com>
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
index 5d3a8e83b1..33ae7183a2 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256	06e604e5484ec03ff763ae680c8b52c33fedcce95a773944f27816fde68503d7	systemd-244.1.tar.gz
+sha256	e6b463733da5eb37075352a64112d030b8612935a54e5b3468279a4f15a4cec4	systemd-244.3.tar.gz
 sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6	LICENSE.GPL2
 sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	LICENSE.LGPL2.1
 sha256	ca008b0178b6390e874f6e4a890fbed482b0fb946159a3b1d370bd8d2327d9bc	README
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 6e31a14ac3..1150fd390e 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSTEMD_VERSION = 244.1
+SYSTEMD_VERSION = 244.3
 SYSTEMD_SITE = $(call github,systemd,systemd-stable,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = LGPL-2.1+, GPL-2.0+ (udev), Public Domain (few source files, see README), BSD-3-Clause (tools/chromiumos)
 SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README tools/chromiumos/LICENSE
-- 
2.24.1
