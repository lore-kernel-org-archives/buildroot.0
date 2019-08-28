From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Aug 2019 14:43:17 +0200
Subject: [Buildroot] [git commit] package/x265: bump version to 3.1.2
Message-ID: <20190903133622.DB04A8A5E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a5f4a457923f9564b2d3cae389c756c0aa59e9b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://bitbucket.org/multicoreware/x265/src/Release_3.1/doc/reST/releasenotes.rst

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x265/x265.hash | 2 +-
 package/x265/x265.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x265/x265.hash b/package/x265/x265.hash
index 16ca5d3ce6..7cdb02be02 100644
--- a/package/x265/x265.hash
+++ b/package/x265/x265.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 c5b9fc260cabbc4a81561a448f4ce9cad7218272b4011feabc3a6b751b2f0662  x265_3.0.tar.gz
+sha256 6f785f1c9a42e00a56402da88463bb861c49d9af108be53eb3ef10295f2a59aa  x265_3.1.2.tar.gz
 sha256 d8afb1bcc7a2cfc603683b168d6987ef0a48e59e0da3693bf55c5d33b67e2b49  COPYING
diff --git a/package/x265/x265.mk b/package/x265/x265.mk
index 4e3b3bfa8e..74a46e37a2 100644
--- a/package/x265/x265.mk
+++ b/package/x265/x265.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-X265_VERSION = 3.0
+X265_VERSION = 3.1.2
 X265_SOURCE = x265_$(X265_VERSION).tar.gz
 X265_SITE = https://bitbucket.org/multicoreware/x265/downloads
 X265_LICENSE = GPL-2.0+
