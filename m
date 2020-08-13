From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Aug 2020 20:19:42 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/systemd: bump
 version to 245.6
Message-ID: <20200813182808.34310811F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f057bafd9b40cd83c375dc73116d849a3f8c4fa3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
[yann.morin.1998 at free.fr: two sapces in hash file]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 3d54d99c6ea58339785770f34d6bda8c60aa1956)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/systemd/systemd.hash | 10 +++++-----
 package/systemd/systemd.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index ea67a0ef7f..64ba6405b0 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,6 +1,6 @@
 # sha256 locally computed
-sha256	b754d75617665a53bd0a1e8f5ec526b383f17e1cc06d1056399e5859e0b6fe06	systemd-245.5.tar.gz
-sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6	LICENSE.GPL2
-sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	LICENSE.LGPL2.1
-sha256	f7299f5f5e8bdffd347dce1bed888b1cea6ddaf27de521c307265098bcbeae92	README
-sha256	83bb6bd9ccd2cf5230cb1807ed16258289768dc4d9cb80069a814e04415a1275	tools/chromiumos/LICENSE
+sha256  f58424fd2d105503f836ff7d099d762901fb40347de993fce7373d65ff640f5b  systemd-245.6.tar.gz
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
+sha256  f7299f5f5e8bdffd347dce1bed888b1cea6ddaf27de521c307265098bcbeae92  README
+sha256  83bb6bd9ccd2cf5230cb1807ed16258289768dc4d9cb80069a814e04415a1275  tools/chromiumos/LICENSE
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 5d6b759140..07f4bc82d9 100644
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
