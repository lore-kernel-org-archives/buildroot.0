From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  2 Mar 2021 14:18:33 +0100
Subject: [Buildroot] [PATCH 2/2] package/suricata: bump to version 6.0.2
In-Reply-To: <20210302131833.360419-1-fontaine.fabrice@gmail.com>
References: <20210302131833.360419-1-fontaine.fabrice@gmail.com>
Message-ID: <20210302131833.360419-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This release is a bug fix release, fixing numerous important issues:
https://suricata-ids.org/2021/03/02/suricata-6-0-2-and-5-0-6-released/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
index 6549c485b3..a7a6e10c03 100644
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
-- 
2.30.0
