From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Jul 2021 23:32:20 +0200
Subject: [Buildroot] [git commit] package/suricata: security bump to version
 6.0.3
Message-ID: <20210716205839.211BE91218@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=4c429c3f8c322381991a58fcc37c01da9eb5e8a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Various security, performance, accuracy and stability issues have been
fixed, including a critical evasion assigned CVE-2021-35063.

https://forum.suricata.io/t/suricata-6-0-3-and-5-0-7-released/1489

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/suricata/suricata.hash | 2 +-
 package/suricata/suricata.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/suricata/suricata.hash b/package/suricata/suricata.hash
index 8395177811..74cc7435cb 100644
--- a/package/suricata/suricata.hash
+++ b/package/suricata/suricata.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  5e4647a07cb31b5d6d0049972a45375c137de908a964a44e2d6d231fa3ad4b52  suricata-6.0.2.tar.gz
+sha256  daf134bb2d7c980035e9ae60f7aaf313323a809340009f26e48110ccde81f602  suricata-6.0.3.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/suricata/suricata.mk b/package/suricata/suricata.mk
index ab8f27c313..ebeaa68d34 100644
--- a/package/suricata/suricata.mk
+++ b/package/suricata/suricata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SURICATA_VERSION = 6.0.2
+SURICATA_VERSION = 6.0.3
 SURICATA_SITE = https://www.openinfosecfoundation.org/download
 SURICATA_LICENSE = GPL-2.0
 SURICATA_LICENSE_FILES = COPYING LICENSE
