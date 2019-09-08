From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Sep 2019 01:09:19 +0200
Subject: [Buildroot] [git commit] package/openal: bump to version 1.19.1
Message-ID: <20190908230500.5A6888D59C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eb603276194f56bad2211001622cd351f562453a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash for license file.

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openal/openal.hash | 3 ++-
 package/openal/openal.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/openal/openal.hash b/package/openal/openal.hash
index cb41dc4e12..219e334e6e 100644
--- a/package/openal/openal.hash
+++ b/package/openal/openal.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 9f8ac1e27fba15a59758a13f0c7f6540a0605b6c3a691def9d420570506d7e82  openal-soft-1.18.2.tar.bz2
+sha256 5c2f87ff5188b95e0dc4769719a9d89ce435b8322b4478b95dd4b427fe84b2e9  openal-soft-1.19.1.tar.bz2
+sha256 d808ce217e5b611854da622b57ec29fe545584c48bc5352fae72a4b6e5074a15  COPYING
diff --git a/package/openal/openal.mk b/package/openal/openal.mk
index c687c08be1..e15cf320c0 100644
--- a/package/openal/openal.mk
+++ b/package/openal/openal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENAL_VERSION = 1.18.2
+OPENAL_VERSION = 1.19.1
 OPENAL_SOURCE = openal-soft-$(OPENAL_VERSION).tar.bz2
 OPENAL_SITE = http://kcat.strangesoft.net/openal-releases
 OPENAL_LICENSE = LGPL-2.0+
