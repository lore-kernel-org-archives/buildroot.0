From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Jan 2021 21:21:14 +0100
Subject: [Buildroot] [git commit] package/belr: bump to version 4.4.8
Message-ID: <20210102200339.0B7AB826B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9869e6c686b49e7a12d1d6cb93ddc202350392f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/belr/belr.hash | 2 +-
 package/belr/belr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/belr/belr.hash b/package/belr/belr.hash
index 42cf506972..00c733c7df 100644
--- a/package/belr/belr.hash
+++ b/package/belr/belr.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d6575c36c32828edcaf39df2775070b187019b21fe5fe274e7a85caf54284f05  belr-4.3.1.tar.gz
+sha256  6358aa680193d972c831d677da1652c7f57d7e00649b971d4d9fbdebf4331b48  belr-4.4.8.tar.gz
 sha256  1b3782ccad7b8614100cda30d3faf42fc39f2e97932908c543005053b654ca68  LICENSE.txt
diff --git a/package/belr/belr.mk b/package/belr/belr.mk
index 8855f94fda..f243830a85 100644
--- a/package/belr/belr.mk
+++ b/package/belr/belr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BELR_VERSION = 4.3.1
+BELR_VERSION = 4.4.8
 BELR_SITE = https://gitlab.linphone.org/BC/public/belr/-/archive/$(BELR_VERSION)
 BELR_LICENSE = GPL-3.0+
 BELR_LICENSE_FILES = LICENSE.txt
