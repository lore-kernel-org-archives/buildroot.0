From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Jun 2017 20:28:49 -0000
Subject: [Buildroot] [git commit] tcpreplay: bump version to 4.2.4
Message-ID: <20170601202848.90D1B8274A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=501ea05ad2050796cf30fecf1870d7536c9eca18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tcpreplay/tcpreplay.hash | 2 +-
 package/tcpreplay/tcpreplay.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tcpreplay/tcpreplay.hash b/package/tcpreplay/tcpreplay.hash
index 9909678..9e8d151 100644
--- a/package/tcpreplay/tcpreplay.hash
+++ b/package/tcpreplay/tcpreplay.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 68d8d49dab5bf58b2e8d244eee1ee7f2379d967da19fe97dd9d59bcf40a22abc  tcpreplay-4.2.3.tar.gz
+sha256 da78ea1a1fe8ff177a4f9e71c4c6739b79ac86db2c2bb90955318b8e8439beb7  tcpreplay-4.2.4.tar.gz
diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
index 6d5c32b..879f518 100644
--- a/package/tcpreplay/tcpreplay.mk
+++ b/package/tcpreplay/tcpreplay.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TCPREPLAY_VERSION = 4.2.3
+TCPREPLAY_VERSION = 4.2.4
 TCPREPLAY_SITE = https://github.com/appneta/tcpreplay/releases/download/v$(TCPREPLAY_VERSION)
 TCPREPLAY_LICENSE = GPL-3.0
 TCPREPLAY_LICENSE_FILES = docs/LICENSE
