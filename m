From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Oct 2017 23:49:33 +0200
Subject: [Buildroot] [git commit] mpd: bump to version 0.20.11
Message-ID: <20171022214225.6AE6F7F8A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=32caa954b032f9728231c85c8703fe5cad4567d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpd/mpd.hash | 2 +-
 package/mpd/mpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index 9898c38..717b921 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256  52fbc1125cdba41ba999add2820d45f3ce7cf493006bb04d8f0b2937204d3121  mpd-0.20.10.tar.xz
+sha256  e9227d9daf32a63d6f34bf2ea18b3179b4a383e9d2b49d548702a37451e514bc  mpd-0.20.11.tar.xz
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index ff22593..b337196 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.20
-MPD_VERSION = $(MPD_VERSION_MAJOR).10
+MPD_VERSION = $(MPD_VERSION_MAJOR).11
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost
