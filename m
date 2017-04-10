From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 10 Apr 2017 12:08:52 +0100
Subject: [Buildroot] [PATCH] tcpreplay: bump version to 4.2.2
Message-ID: <20170410110852.21172-1-Vincent.Riera@imgtec.com>
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
index 802d650..0b138a0 100644
--- a/package/tcpreplay/tcpreplay.hash
+++ b/package/tcpreplay/tcpreplay.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 224b519e561d969b4bdb0e700c2283e036620e3cb5895d5aab2a7e4f27d21a79  tcpreplay-4.2.1.tar.gz
+sha256 e674166b54486db8f5417554ed88c06f44f368d70585c2897b0bc085009d8dd5  tcpreplay-4.2.2.tar.gz
diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
index df85fe1..7b03138 100644
--- a/package/tcpreplay/tcpreplay.mk
+++ b/package/tcpreplay/tcpreplay.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TCPREPLAY_VERSION = 4.2.1
+TCPREPLAY_VERSION = 4.2.2
 TCPREPLAY_SITE = https://github.com/appneta/tcpreplay/releases/download/v$(TCPREPLAY_VERSION)
 TCPREPLAY_LICENSE = GPL-3.0
 TCPREPLAY_LICENSE_FILES = docs/LICENSE
-- 
2.10.2
