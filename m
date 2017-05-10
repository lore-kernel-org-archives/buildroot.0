From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 10 May 2017 12:09:10 +0100
Subject: [Buildroot] [PATCH next 3/3] tcpreplay: bump version to 4.2.5
In-Reply-To: <20170510110910.27889-1-Vincent.Riera@imgtec.com>
References: <20170510110910.27889-1-Vincent.Riera@imgtec.com>
Message-ID: <20170510110910.27889-3-Vincent.Riera@imgtec.com>
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
index 9e8d151..c908964 100644
--- a/package/tcpreplay/tcpreplay.hash
+++ b/package/tcpreplay/tcpreplay.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 da78ea1a1fe8ff177a4f9e71c4c6739b79ac86db2c2bb90955318b8e8439beb7  tcpreplay-4.2.4.tar.gz
+sha256 941026be34e1db5101d3d22ebddd6fff76179a1ee81e273338f533ba4eca89d7  tcpreplay-4.2.5.tar.gz
diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
index 879f518..d303c60 100644
--- a/package/tcpreplay/tcpreplay.mk
+++ b/package/tcpreplay/tcpreplay.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TCPREPLAY_VERSION = 4.2.4
+TCPREPLAY_VERSION = 4.2.5
 TCPREPLAY_SITE = https://github.com/appneta/tcpreplay/releases/download/v$(TCPREPLAY_VERSION)
 TCPREPLAY_LICENSE = GPL-3.0
 TCPREPLAY_LICENSE_FILES = docs/LICENSE
-- 
2.10.2
