From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 5 Jul 2020 15:27:44 +0200
Subject: [Buildroot] [git commit] package/swig: bump version to 4.0.2
Message-ID: <20200705135158.3F319861A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cef4607eb2721c5585506ba9e217d6e3280a0200
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/swig/swig.hash | 2 +-
 package/swig/swig.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/swig/swig.hash b/package/swig/swig.hash
index fdc57129b8..08b2b5a1ef 100644
--- a/package/swig/swig.hash
+++ b/package/swig/swig.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256	7a00b4d0d53ad97a14316135e2d702091cd5f193bb58bcfcd8bc59d41e7887a9	swig-4.0.1.tar.gz
+sha256	d53be9730d8d58a16bf0cbd1f8ac0c0c3e1090573168bfa151b01eb47fa906fc	swig-4.0.2.tar.gz
 sha256	f53abaeed775018d519a1b9615f0ca17894772bd9ca21c2a156bf340ac41c13e	LICENSE
 sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	LICENSE-GPL
 sha256	7f50d942373a871211c5efee03f3db2f9efd1cff1002b0ef8e3748baa611a5c2	LICENSE-UNIVERSITIES
diff --git a/package/swig/swig.mk b/package/swig/swig.mk
index 5881a0e423..437cf448be 100644
--- a/package/swig/swig.mk
+++ b/package/swig/swig.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SWIG_VERSION_MAJOR = 4.0
-SWIG_VERSION = $(SWIG_VERSION_MAJOR).1
+SWIG_VERSION = $(SWIG_VERSION_MAJOR).2
 SWIG_SITE = http://downloads.sourceforge.net/project/swig/swig/swig-$(SWIG_VERSION)
 HOST_SWIG_DEPENDENCIES = host-bison host-pcre
 HOST_SWIG_CONF_OPTS = \
