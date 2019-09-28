From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Sep 2019 23:17:03 +0200
Subject: [Buildroot] [git commit] package/b43-fwcutter: bump to version 019
Message-ID: <20190928211144.794EB826D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8c938248c930d08f1054545cc6a356d084b2d80c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/b43-fwcutter/b43-fwcutter.hash | 5 ++++-
 package/b43-fwcutter/b43-fwcutter.mk   | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/b43-fwcutter/b43-fwcutter.hash b/package/b43-fwcutter/b43-fwcutter.hash
index 3181c76960..e83a49711a 100644
--- a/package/b43-fwcutter/b43-fwcutter.hash
+++ b/package/b43-fwcutter/b43-fwcutter.hash
@@ -1,2 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256	4c6a53d1f5d76b8aa224d294bee47726b1477f35327f4e23e8cb799865e0f6eb	b43-fwcutter-015.tar.bz2
+sha256	d6ea85310df6ae08e7f7e46d8b975e17fc867145ee249307413cfbe15d7121ce	b43-fwcutter-019.tar.bz2
+
+# Hash for license file
+sha256	6af9fc424d57f29b7e59b35e52d4a91aca80304506275f2c0c076317fc6eb583	COPYING
diff --git a/package/b43-fwcutter/b43-fwcutter.mk b/package/b43-fwcutter/b43-fwcutter.mk
index 91ba3dc758..9c1e11102d 100644
--- a/package/b43-fwcutter/b43-fwcutter.mk
+++ b/package/b43-fwcutter/b43-fwcutter.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-B43_FWCUTTER_VERSION = 015
+B43_FWCUTTER_VERSION = 019
 B43_FWCUTTER_SITE = http://bues.ch/b43/fwcutter
 B43_FWCUTTER_SOURCE = b43-fwcutter-$(B43_FWCUTTER_VERSION).tar.bz2
 B43_FWCUTTER_LICENSE = BSD-2-Clause
