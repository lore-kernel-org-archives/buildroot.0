From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Dec 2017 22:57:18 +0100
Subject: [Buildroot] [git commit] mpd: bump to version 0.20.12
Message-ID: <20171206215014.CAA1D8100E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=52e732993a7a7c3e8db6fd6c141e787349157518
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mpd/mpd.hash | 2 +-
 package/mpd/mpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index 717b921..16661e5 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256  e9227d9daf32a63d6f34bf2ea18b3179b4a383e9d2b49d548702a37451e514bc  mpd-0.20.11.tar.xz
+sha256  e159ac0608fb85c891bd19375ed7056d5f9ec4ba492b052f24820513e774f709  mpd-0.20.12.tar.xz
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index b337196..57e3b46 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.20
-MPD_VERSION = $(MPD_VERSION_MAJOR).11
+MPD_VERSION = $(MPD_VERSION_MAJOR).12
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost
