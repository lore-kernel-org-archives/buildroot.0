From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Sep 2017 18:41:03 +0200
Subject: [Buildroot] [git commit] package/libpng: bump version to 1.6.32
Message-ID: <20170902163603.7D97880E47@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3b8e197241448ca7173cad9f0d930526e94f04c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added md5 hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libpng/libpng.hash | 7 ++++---
 package/libpng/libpng.mk   | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
index 4bc7b87..074cf5f 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,4 +1,5 @@
-# From http://sourceforge.net/projects/libpng/files/libpng16/1.6.31/
-sha1 de695064363df331734466981ef7f6546ef516bf  libpng-1.6.31.tar.xz
+# From http://sourceforge.net/projects/libpng/files/libpng16/1.6.32/
+md5 e01be057a9369183c959b793a685ad15  libpng-1.6.32.tar.xz
+sha1 161d91d15cfd739773e0a73b41032b9f27322914  libpng-1.6.32.tar.xz
 # Locally computed:
-sha256 232a602de04916b2b5ce6f901829caf419519e6a16cc9cd7c1c91187d3ee8b41  libpng-1.6.31.tar.xz
+sha256 c918c3113de74a692f0a1526ce881dc26067763eb3915c57ef3a0f7b6886f59b  libpng-1.6.32.tar.xz
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 0c19b29..2aa0217 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.31
+LIBPNG_VERSION = 1.6.32
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng${LIBPNG_SERIES}/$(LIBPNG_VERSION)
