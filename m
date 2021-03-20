From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Mar 2021 22:19:42 +0100
Subject: [Buildroot] [git commit] package/fwts: bump to version 21.02.00
Message-ID: <20210320205536.DBD1A8807C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ab378a44d954a2bfe576896d6c4ca2053be52045
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The dates in the copyright file have changed; update the hash accordingly.

Signed-off-by: Vincent Stehl?? <vincent.stehle@laposte.net>
Cc: Erico Nunes <nunes.erico@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fwts/fwts.hash | 4 ++--
 package/fwts/fwts.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/fwts/fwts.hash b/package/fwts/fwts.hash
index 9b05673152..916035bda6 100644
--- a/package/fwts/fwts.hash
+++ b/package/fwts/fwts.hash
@@ -1,5 +1,5 @@
 # Hash from: http://fwts.ubuntu.com/release/SHA256SUMS
-sha256  bfe7993f1dd328b96a90ecfe92df67063df21afe4b4a103e498da6625c7c71b7  fwts-V20.08.00.tar.gz
+sha256  02160657383a918a48c946a0ffb72c047d19a46f1455c29c0fff4d9ef7e48680  fwts-V21.02.00.tar.gz
 
 # Hash for license file
-sha256  379eab3c1071a6f5b8acd3632586577ec9c47ef10601b10467e890b8ff8b3842  debian/copyright
+sha256  2003f5c8a1e40d7882f1499bd7adb7bc748c9656851abb28647a3d297c2e8e23  debian/copyright
diff --git a/package/fwts/fwts.mk b/package/fwts/fwts.mk
index e4e9defebf..eaff7b786b 100644
--- a/package/fwts/fwts.mk
+++ b/package/fwts/fwts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FWTS_VERSION = 20.08.00
+FWTS_VERSION = 21.02.00
 FWTS_SOURCE = fwts-V$(FWTS_VERSION).tar.gz
 FWTS_SITE = http://fwts.ubuntu.com/release
 FWTS_STRIP_COMPONENTS = 0
