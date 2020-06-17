From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jun 2020 22:56:56 +0200
Subject: [Buildroot] [git commit] package/uftp: bump to version 5.0
Message-ID: <20200617205529.E5FF58447F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=775538c2c92f5154c5a87a1fa665ffee6a652986
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And use two spaces for hash file indentation.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/uftp/uftp.hash | 4 ++--
 package/uftp/uftp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/uftp/uftp.hash b/package/uftp/uftp.hash
index 1e50d1d78a..aaebcad014 100644
--- a/package/uftp/uftp.hash
+++ b/package/uftp/uftp.hash
@@ -1,3 +1,3 @@
 # Locally computed sha256
-sha256	ecab6ab07fe0ebaf7bfe35d99fe2da28ede3ddc6f21f825d3b259cf171258505	uftp-4.10.2.tar.gz
-sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	LICENSE.txt
+sha256  562f71ea5a24b615eb491f5744bad01e9c2e58244c1d6252d5ae98d320d308e0  uftp-5.0.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.txt
diff --git a/package/uftp/uftp.mk b/package/uftp/uftp.mk
index e1369da52b..1c36cb0ce6 100644
--- a/package/uftp/uftp.mk
+++ b/package/uftp/uftp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UFTP_VERSION = 4.10.2
+UFTP_VERSION = 5.0
 UFTP_SITE = http://sourceforge.net/projects/uftp-multicast/files/source-tar
 UFTP_LICENSE = GPL-3.0+
 UFTP_LICENSE_FILES = LICENSE.txt
