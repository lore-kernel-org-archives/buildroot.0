From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 28 Nov 2020 10:57:25 +0100
Subject: [Buildroot] [PATCH 1/1] package/setserial: add license hash
Message-ID: <20201128095725.1084152-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also reformatted hash file.

Fixes:
http://autobuild.buildroot.net/results/d1c/d1ccecc74755155664cd17c8d33721c804a37b25/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/setserial/setserial.hash | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/setserial/setserial.hash b/package/setserial/setserial.hash
index ce3b369f56..991d2860a9 100644
--- a/package/setserial/setserial.hash
+++ b/package/setserial/setserial.hash
@@ -1,3 +1,5 @@
 # From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/s/setserial/setserial_2.17-45.3.dsc
-sha256	7e4487d320ac31558563424189435d396ddf77953bb23111a17a3d1487b5794a	setserial_2.17.orig.tar.gz
-sha256	33db87e8a86cf12b7c97efca9e056865e71358e8cfeb3931118b2647ce1eecc6	setserial_2.17-45.3.diff.gz
+sha256  7e4487d320ac31558563424189435d396ddf77953bb23111a17a3d1487b5794a  setserial_2.17.orig.tar.gz
+sha256  33db87e8a86cf12b7c97efca9e056865e71358e8cfeb3931118b2647ce1eecc6  setserial_2.17-45.3.diff.gz
+# Locally computed
+sha256  1d7e810ed28daf370def626dfd4c502f2f77d2b678f1ac72e2ba675dd6f9af0d  debian/copyright
-- 
2.27.0
