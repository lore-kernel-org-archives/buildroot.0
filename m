From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Apr 2017 15:23:09 +0200
Subject: [Buildroot] [git commit] batman-adv: bump version to 2017.0.1
Message-ID: <20170408132317.2651882236@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a2f0640e016517d355f921d5c3ab94af50fa60bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Matthias Fritzsche <txt.file@txtfile.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/batman-adv/batman-adv.hash | 5 +++--
 package/batman-adv/batman-adv.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/batman-adv/batman-adv.hash b/package/batman-adv/batman-adv.hash
index 6c0e5ca..0599b91 100644
--- a/package/batman-adv/batman-adv.hash
+++ b/package/batman-adv/batman-adv.hash
@@ -1,2 +1,3 @@
-# From https://downloads.open-mesh.org/batman/stable/sources/batman-adv/batman-adv-2016.1.tar.gz.sha1
-sha1 c9ca52c913fbf81aca266695a77359ecdbcc8bd8 batman-adv-2016.1.tar.gz
+# From https://downloads.open-mesh.org/batman/stable/sources/batman-adv/batman-adv-2017.0.1.tar.gz.{md5,sha1}
+md5  ce14f7f1bbc037691bbbc611e16f0360         batman-adv-2017.0.1.tar.gz
+sha1 593cecc015b876caa5b21fbb4d0f6186742a1abb batman-adv-2017.0.1.tar.gz
diff --git a/package/batman-adv/batman-adv.mk b/package/batman-adv/batman-adv.mk
index ead2cca..5179918 100644
--- a/package/batman-adv/batman-adv.mk
+++ b/package/batman-adv/batman-adv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BATMAN_ADV_VERSION = 2016.1
+BATMAN_ADV_VERSION = 2017.0.1
 BATMAN_ADV_SITE = https://downloads.open-mesh.org/batman/stable/sources/batman-adv
 BATMAN_ADV_LICENSE = GPL-2.0
 
