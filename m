From: aduskett at gmail.com <aduskett@gmail.com>
Date: Wed,  3 Jun 2020 12:23:47 -0700
Subject: [Buildroot] [PATCH 1/1] package/systemd: bump version to 245.6
Message-ID: <20200603192347.519915-1-aduskett@gmail.com>
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
index ea67a0ef7f..94af910866 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256	b754d75617665a53bd0a1e8f5ec526b383f17e1cc06d1056399e5859e0b6fe06	systemd-245.5.tar.gz
+sha256	f58424fd2d105503f836ff7d099d762901fb40347de993fce7373d65ff640f5b	systemd-245.6.tar.gz
 sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6	LICENSE.GPL2
 sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	LICENSE.LGPL2.1
 sha256	f7299f5f5e8bdffd347dce1bed888b1cea6ddaf27de521c307265098bcbeae92	README
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 92de540725..6ccf9d6e37 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSTEMD_VERSION = 245.5
+SYSTEMD_VERSION = 245.6
 SYSTEMD_SITE = $(call github,systemd,systemd-stable,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = LGPL-2.1+, GPL-2.0+ (udev), Public Domain (few source files, see README), BSD-3-Clause (tools/chromiumos)
 SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README tools/chromiumos/LICENSE
-- 
2.26.2
