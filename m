From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 17 May 2017 14:42:29 +0100
Subject: [Buildroot] [PATCH next] tcpreplay: bump version to 4.2.6
Message-ID: <20170517134229.22559-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/tcpreplay/tcpreplay.hash | 2 +-
 package/tcpreplay/tcpreplay.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tcpreplay/tcpreplay.hash b/package/tcpreplay/tcpreplay.hash
index c90896494..b033d3c3f 100644
--- a/package/tcpreplay/tcpreplay.hash
+++ b/package/tcpreplay/tcpreplay.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 941026be34e1db5101d3d22ebddd6fff76179a1ee81e273338f533ba4eca89d7  tcpreplay-4.2.5.tar.gz
+sha256 043756c532dab93e2be33a517ef46b1341f7239278a1045ae670041dd8a4531d  tcpreplay-4.2.6.tar.gz
diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
index d303c60eb..adccde0eb 100644
--- a/package/tcpreplay/tcpreplay.mk
+++ b/package/tcpreplay/tcpreplay.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TCPREPLAY_VERSION = 4.2.5
+TCPREPLAY_VERSION = 4.2.6
 TCPREPLAY_SITE = https://github.com/appneta/tcpreplay/releases/download/v$(TCPREPLAY_VERSION)
 TCPREPLAY_LICENSE = GPL-3.0
 TCPREPLAY_LICENSE_FILES = docs/LICENSE
-- 
2.13.0
