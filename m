From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Oct 2020 23:27:43 +0200
Subject: [Buildroot] [git commit] package/suricata: security bump to version
 4.1.9
Message-ID: <20201009075442.9E2608218E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1bfc53289aabe967f75f92eb1e89f1d59abf5632
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These are the second releases after Suricata joined the Oss-Fuzz
program, leading to discovery of a number of (potential) security
issues. We recommend upgrading as soon as possible.

https://suricata-ids.org/2020/10/08/suricata-4-1-9-and-5-0-4-released

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/suricata/suricata.hash | 2 +-
 package/suricata/suricata.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/suricata/suricata.hash b/package/suricata/suricata.hash
index 05e3593c3b..9e79f3a96c 100644
--- a/package/suricata/suricata.hash
+++ b/package/suricata/suricata.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  c8a83a05f57cedc0ef81d833ddcfdbbfdcdb6f459a91b1b15dc2d5671f1aecbb  suricata-4.1.8.tar.gz
+sha256  3440cd1065b1b3999dc101a37c49321fab2791b38f16e2f7fe27369dd007eea7  suricata-4.1.9.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/suricata/suricata.mk b/package/suricata/suricata.mk
index 8dd23bf2f5..d6ae48c1f5 100644
--- a/package/suricata/suricata.mk
+++ b/package/suricata/suricata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SURICATA_VERSION = 4.1.8
+SURICATA_VERSION = 4.1.9
 SURICATA_SITE = https://www.openinfosecfoundation.org/download
 SURICATA_LICENSE = GPL-2.0
 SURICATA_LICENSE_FILES = COPYING LICENSE
