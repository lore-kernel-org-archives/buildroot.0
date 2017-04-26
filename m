From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Apr 2017 08:59:56 +0200
Subject: [Buildroot] [git commit] tcpreplay: bump version to 4.2.3
Message-ID: <20170426072112.DF4E28280B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=27a1629e859f01e74c3b8eeab0f594787793ab04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tcpreplay/tcpreplay.hash | 2 +-
 package/tcpreplay/tcpreplay.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tcpreplay/tcpreplay.hash b/package/tcpreplay/tcpreplay.hash
index 0b138a0..9909678 100644
--- a/package/tcpreplay/tcpreplay.hash
+++ b/package/tcpreplay/tcpreplay.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 e674166b54486db8f5417554ed88c06f44f368d70585c2897b0bc085009d8dd5  tcpreplay-4.2.2.tar.gz
+sha256 68d8d49dab5bf58b2e8d244eee1ee7f2379d967da19fe97dd9d59bcf40a22abc  tcpreplay-4.2.3.tar.gz
diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
index 7b03138..6d5c32b 100644
--- a/package/tcpreplay/tcpreplay.mk
+++ b/package/tcpreplay/tcpreplay.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TCPREPLAY_VERSION = 4.2.2
+TCPREPLAY_VERSION = 4.2.3
 TCPREPLAY_SITE = https://github.com/appneta/tcpreplay/releases/download/v$(TCPREPLAY_VERSION)
 TCPREPLAY_LICENSE = GPL-3.0
 TCPREPLAY_LICENSE_FILES = docs/LICENSE
