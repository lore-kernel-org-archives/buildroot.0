From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 5 Nov 2017 17:45:05 +0100
Subject: [Buildroot] [git commit] package/bluez_utils: add license hash
Message-ID: <20171105163750.E706F7F8A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eea2aeddc1a71c21f63c03ea41577223d0676258
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/bluez_utils/bluez_utils.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/bluez_utils/bluez_utils.hash b/package/bluez_utils/bluez_utils.hash
index 09b7b21..39e750e 100644
--- a/package/bluez_utils/bluez_utils.hash
+++ b/package/bluez_utils/bluez_utils.hash
@@ -1,2 +1,5 @@
 # From https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc:
 sha256	41f9578bef39b8c94a2d6ddeaa556afd22d136936d0f03100e422fe970a45a7d  bluez-4.101.tar.xz
+# License files, locally calculated
+sha256	b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
+sha256	ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING.LIB
