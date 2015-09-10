From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Sep 2015 12:56:59 +0200
Subject: [Buildroot] [git commit] package/libsoxr: bump to version 0.1.2
Message-ID: <20150910122136.5D0B881F67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=855a5afde6f593a42da62f0c9eef6e4ecea6b47b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsoxr/libsoxr.hash |    5 ++++-
 package/libsoxr/libsoxr.mk   |    2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/libsoxr/libsoxr.hash b/package/libsoxr/libsoxr.hash
index f49cc81..066b546 100644
--- a/package/libsoxr/libsoxr.hash
+++ b/package/libsoxr/libsoxr.hash
@@ -1,2 +1,5 @@
+# From http://sourceforge.net/projects/soxr/files/
+sha1  3b990f91dc8dc08e70626cd5fb90deda0239c211  soxr-0.1.2-Source.tar.xz
+md5  0866fc4320e26f47152798ac000de1c0  soxr-0.1.2-Source.tar.xz
 # Locally calculated
-sha256  dcc16868d1a157079316f84233afcc2b52dd0bd541dd8439dc25bceb306faac2  soxr-0.1.1-Source.tar.xz
+sha256  54e6f434f1c491388cd92f0e3c47f1ade082cc24327bdc43762f7d1eefe0c275  soxr-0.1.2-Source.tar.xz
diff --git a/package/libsoxr/libsoxr.mk b/package/libsoxr/libsoxr.mk
index eea1418..0fdc570 100644
--- a/package/libsoxr/libsoxr.mk
+++ b/package/libsoxr/libsoxr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSOXR_VERSION = 0.1.1
+LIBSOXR_VERSION = 0.1.2
 LIBSOXR_SOURCE = soxr-$(LIBSOXR_VERSION)-Source.tar.xz
 LIBSOXR_SITE = http://downloads.sourceforge.net/project/soxr
 LIBSOXR_LICENSE = LGPLv2.1+
