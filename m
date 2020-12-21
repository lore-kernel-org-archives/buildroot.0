From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 21 Dec 2020 14:56:06 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/suricata: bump to
 version 6.0.1
Message-ID: <20201221134010.C700681309@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=850aa92b170b751e2b2d7d5188f5df3452924ac0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

These releases are bug fix releases, fixing numerous important issues.

The 6.0.1 release also improves the experimental HTTP/2 support.

https://suricata-ids.org/2020/12/04/suricata-6-0-1-5-0-5-and-4-1-10-released

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 611d06d48670e341ab2906da9b42df64b8b62ff6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/suricata/suricata.hash | 2 +-
 package/suricata/suricata.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/suricata/suricata.hash b/package/suricata/suricata.hash
index a6cf43fb66..7435c1b96f 100644
--- a/package/suricata/suricata.hash
+++ b/package/suricata/suricata.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  3c175a6dee9071141391f64828502cfb6e48dc1a20833e1411fb45be5368923b  suricata-6.0.0.tar.gz
+sha256  e7a1798fe59c1d213f752feefbf8bb54168f9fa56235cf3380347c696ecdb1ae  suricata-6.0.1.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/suricata/suricata.mk b/package/suricata/suricata.mk
index 94c4784dd4..a8970fe9a4 100644
--- a/package/suricata/suricata.mk
+++ b/package/suricata/suricata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SURICATA_VERSION = 6.0.0
+SURICATA_VERSION = 6.0.1
 SURICATA_SITE = https://www.openinfosecfoundation.org/download
 SURICATA_LICENSE = GPL-2.0
 SURICATA_LICENSE_FILES = COPYING LICENSE
