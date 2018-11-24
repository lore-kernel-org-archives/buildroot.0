From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Nov 2018 11:12:47 +0100
Subject: [Buildroot] [git commit] package/linuxptp: bump to version 2.0
Message-ID: <20181202071558.833F182855@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9226efda7621c400c8932d5428dabc20e2552a50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linuxptp/linuxptp.hash | 9 ++++++++-
 package/linuxptp/linuxptp.mk   | 6 +++---
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/package/linuxptp/linuxptp.hash b/package/linuxptp/linuxptp.hash
index ef2db56226..5e6c7741cd 100644
--- a/package/linuxptp/linuxptp.hash
+++ b/package/linuxptp/linuxptp.hash
@@ -1,2 +1,9 @@
+# From https://sourceforge.net/projects/linuxptp/files/v2.0/
+sha1 592ca42c6146a79c1fcabed7c19fa7af4803d4f6  linuxptp-2.0.tgz
+md5 d8bb7374943bb747db7786ac26f17f11  linuxptp-2.0.tgz
+
 # Locally computed:
-sha256 d0ccc4591966e21819cdc248765ebbe02456bc8ca37845eb7c23c2d1ff9bcf6b  linuxptp-303b08cbf55096aba55bd08a314e0701e5c33482.tar.gz
+sha256 0a24d9401e87d4af023d201e234d91127d82c350daad93432106284aa9459c7d  linuxptp-2.0.tgz
+
+# Hash for license file:
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/linuxptp/linuxptp.mk b/package/linuxptp/linuxptp.mk
index f43fee6f69..c304ff6d6e 100644
--- a/package/linuxptp/linuxptp.mk
+++ b/package/linuxptp/linuxptp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LINUXPTP_VERSION = 303b08cbf55096aba55bd08a314e0701e5c33482
-LINUXPTP_SITE_METHOD = git
-LINUXPTP_SITE = git://git.code.sf.net/p/linuxptp/code
+LINUXPTP_VERSION = 2.0
+LINUXPTP_SOURCE = linuxptp-$(LINUXPTP_VERSION).tgz
+LINUXPTP_SITE = http://downloads.sourceforge.net/linuxptp
 LINUXPTP_LICENSE = GPL-2.0+
 LINUXPTP_LICENSE_FILES = COPYING
 
