From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Jul 2017 17:56:27 +0200
Subject: [Buildroot] [git commit] package/x265: bump version to 2.5
Message-ID: <20170724155219.2F05F80408@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=168cac4fbce91233710903426f40887456b349df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x265/x265.hash | 2 +-
 package/x265/x265.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x265/x265.hash b/package/x265/x265.hash
index 1ad8170..3e44b03 100644
--- a/package/x265/x265.hash
+++ b/package/x265/x265.hash
@@ -1,2 +1,2 @@
 # Locally generated
-sha256 9c2aa718d78f6fecdd783f08ab83b98d3169e5f670404da4c16439306907d729  x265_2.4.tar.gz
+sha256 2e53259b504a7edb9b21b9800163b1ff4c90e60c74e23e7001d423c69c5d3d17  x265_2.5.tar.gz
diff --git a/package/x265/x265.mk b/package/x265/x265.mk
index 2facf2c..ae570e6 100644
--- a/package/x265/x265.mk
+++ b/package/x265/x265.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-X265_VERSION = 2.4
+X265_VERSION = 2.5
 X265_SOURCE = x265_$(X265_VERSION).tar.gz
 X265_SITE = https://bitbucket.org/multicoreware/x265/downloads
 X265_LICENSE = GPL-2.0+
