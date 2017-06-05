From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jun 2017 15:56:00 +0200
Subject: [Buildroot] [git commit] package/imlib2: bump version to 1.4.10
Message-ID: <20170605140109.BD19D82A15@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9b95898c4977d72595fc9037cb0f1601943248f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/imlib2/imlib2.hash | 6 +++---
 package/imlib2/imlib2.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/imlib2/imlib2.hash b/package/imlib2/imlib2.hash
index 6e1faaf..0c234c8 100644
--- a/package/imlib2/imlib2.hash
+++ b/package/imlib2/imlib2.hash
@@ -1,3 +1,3 @@
-# From https://sourceforge.net/projects/enlightenment/files/imlib2-src/1.4.9/
-md5	23ef8b49f2793bc63b16839a2062298b	imlib2-1.4.9.tar.bz2
-sha1	f389d67c337b604a365e620b0083b2d342dd724e	imlib2-1.4.9.tar.bz2
+# From https://sourceforge.net/projects/enlightenment/files/imlib2-src/1.4.10/
+md5 a0de8524592bbd9f24fcc6cb8352137c  imlib2-1.4.10.tar.bz2
+sha1 664df65c6265a2825d685d2f3a4f0d072eb626ac  imlib2-1.4.10.tar.bz2
diff --git a/package/imlib2/imlib2.mk b/package/imlib2/imlib2.mk
index 7da032f..b5012a6 100644
--- a/package/imlib2/imlib2.mk
+++ b/package/imlib2/imlib2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMLIB2_VERSION = 1.4.9
+IMLIB2_VERSION = 1.4.10
 IMLIB2_SOURCE = imlib2-$(IMLIB2_VERSION).tar.bz2
 IMLIB2_SITE = http://downloads.sourceforge.net/project/enlightenment/imlib2-src/$(IMLIB2_VERSION)
 IMLIB2_LICENSE = imlib2 license
