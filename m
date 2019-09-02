From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 15:56:38 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/batman-adv: fix
 license
Message-ID: <20190902135230.51E3F89133@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4f4c12f125e97faa39cf3954851b5fa011053f8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

batman_adv.h is licensed under MIT

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6db83bf6bc4786bec46df40828fcec69975b6713)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/batman-adv/batman-adv.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/batman-adv/batman-adv.mk b/package/batman-adv/batman-adv.mk
index 51799186d8..2cebe13562 100644
--- a/package/batman-adv/batman-adv.mk
+++ b/package/batman-adv/batman-adv.mk
@@ -6,7 +6,7 @@
 
 BATMAN_ADV_VERSION = 2017.0.1
 BATMAN_ADV_SITE = https://downloads.open-mesh.org/batman/stable/sources/batman-adv
-BATMAN_ADV_LICENSE = GPL-2.0
+BATMAN_ADV_LICENSE = GPL-2.0, MIT (batman_adv.h)
 
 # Bridge Loop Avoidance, Distributed Arp Table are always enabled
 BATMAN_ADV_CFLAGS = \
