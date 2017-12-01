From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Dec 2017 22:42:57 +0100
Subject: [Buildroot] [git commit] mc: bump version to 4.8.20
Message-ID: <20171201213536.269D0825C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9070fb3fbdf47e6f996373e5c5c1677c2ae3ae65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add licence checksum.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mc/mc.hash | 6 ++++--
 package/mc/mc.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/mc/mc.hash b/package/mc/mc.hash
index cb48f2e..d980b8a 100644
--- a/package/mc/mc.hash
+++ b/package/mc/mc.hash
@@ -1,2 +1,4 @@
-# Hash from http://ftp.midnight-commander.org/mc-4.8.19.sha256:
-sha256 eb9e56bbb5b2893601d100d0e0293983049b302c5ab61bfb544ad0ee2cc1f2df  mc-4.8.19.tar.xz
+# Hash from http://ftp.midnight-commander.org/mc-4.8.20.sha256:
+sha256  017ee7f4f8ae420a04f4d6fcebaabe5b494661075c75442c76e9c8b1923d501c  mc-4.8.20.tar.xz
+# sha256 locally computed:
+sha256  5576bbec76296e1c8e081f7037ebd01bdada388635f58d844a2f20d37bbe4284  COPYING
diff --git a/package/mc/mc.mk b/package/mc/mc.mk
index a032c2f..a83c5f0 100644
--- a/package/mc/mc.mk
+++ b/package/mc/mc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MC_VERSION = 4.8.19
+MC_VERSION = 4.8.20
 MC_SOURCE = mc-$(MC_VERSION).tar.xz
 MC_SITE = http://ftp.midnight-commander.org
 MC_LICENSE = GPL-3.0+
