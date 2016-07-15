From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 09:50:10 +0200
Subject: [Buildroot] [git commit] package/mpd: bump to version 0.19.17
Message-ID: <20160715075150.F3EAF82231@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5b3ea02d6492ace88418e58f4ded62fa6e6605cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mpd/mpd.hash | 2 +-
 package/mpd/mpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index cc2cebc..2395cb7 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256  58ecbff4b07ec42a6f31bdbbb3c3eb51317978e4a0ea3071f6ae6127848a03d6  mpd-0.19.16.tar.xz
+sha256  487ec8ad2b1c1c193c2a7c8975a8b8fe2e4f0335bcc2e9356b2b34a0179fb2f7  mpd-0.19.17.tar.xz
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 75f8bb4..6e2cf8c 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.19
-MPD_VERSION = $(MPD_VERSION_MAJOR).16
+MPD_VERSION = $(MPD_VERSION_MAJOR).17
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost libglib2
