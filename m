From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Mar 2021 22:09:49 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/suricata: bump to
 version 6.0.2
Message-ID: <20210316204816.8DF0F7FA52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=41a7c61983d25158201655fce87dd16126da9cc6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

This release is a bug fix release, fixing numerous important issues:
https://suricata-ids.org/2021/03/02/suricata-6-0-2-and-5-0-6-released/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit cac588d79a7fb30d6af1640cd6c90c6a3b7204b7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/suricata/suricata.hash | 2 +-
 package/suricata/suricata.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/suricata/suricata.hash b/package/suricata/suricata.hash
index 7435c1b96f..8395177811 100644
--- a/package/suricata/suricata.hash
+++ b/package/suricata/suricata.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  e7a1798fe59c1d213f752feefbf8bb54168f9fa56235cf3380347c696ecdb1ae  suricata-6.0.1.tar.gz
+sha256  5e4647a07cb31b5d6d0049972a45375c137de908a964a44e2d6d231fa3ad4b52  suricata-6.0.2.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/suricata/suricata.mk b/package/suricata/suricata.mk
index a8970fe9a4..ab8f27c313 100644
--- a/package/suricata/suricata.mk
+++ b/package/suricata/suricata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SURICATA_VERSION = 6.0.1
+SURICATA_VERSION = 6.0.2
 SURICATA_SITE = https://www.openinfosecfoundation.org/download
 SURICATA_LICENSE = GPL-2.0
 SURICATA_LICENSE_FILES = COPYING LICENSE
