From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Dec 2016 10:57:39 +0100
Subject: [Buildroot] [git commit] package/mpd: bump version to 0.19.20
Message-ID: <20161213095759.708D281D49@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9441f92bdd9a6b67989384193920a495492b7c95
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mpd/mpd.hash | 2 +-
 package/mpd/mpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index 8f620e7..4ded85d 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256  bc856cda4136403446d53d11576f86990b61d1fe4668f6008e9eae47450d4e1d  mpd-0.19.19.tar.xz
+sha256  ecf74993085509c82e2bfadce88434b62b7727d844add9c548eb63532a5e3b8a  mpd-0.19.20.tar.xz
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 0bf8ece..bee7182 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.19
-MPD_VERSION = $(MPD_VERSION_MAJOR).19
+MPD_VERSION = $(MPD_VERSION_MAJOR).20
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost libglib2
