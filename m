From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Oct 2016 11:24:50 +0200
Subject: [Buildroot] [git commit] hiawatha: bump version to 10.4
Message-ID: <20161015092529.7DB0281EE5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fdf9f298d2c863bf9651d469db6abfb9ba73e4bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed for compatibility with mbedtls 2.3.0

Fixes:
http://autobuild.buildroot.net/results/8d7/8d77069856620ec0e95a2e9bd865be08180fedff/
http://autobuild.buildroot.net/results/54b/54b2c7df1b1d2edab5f4925455248eaabea7ef87/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/hiawatha/hiawatha.hash | 2 +-
 package/hiawatha/hiawatha.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hiawatha/hiawatha.hash b/package/hiawatha/hiawatha.hash
index a5207a1..31025d9 100644
--- a/package/hiawatha/hiawatha.hash
+++ b/package/hiawatha/hiawatha.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	99d185fb16bb1ab706724494d3cac86464f1485ed4b0fff09a192eca6da5ff8e	hiawatha-10.3.tar.gz
+sha256	e40ebcbde8fbd5a14dbf7279143757aea02a461940daa5c460496871eaa75454	hiawatha-10.4.tar.gz
diff --git a/package/hiawatha/hiawatha.mk b/package/hiawatha/hiawatha.mk
index dc49216..8821b0f 100644
--- a/package/hiawatha/hiawatha.mk
+++ b/package/hiawatha/hiawatha.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HIAWATHA_VERSION = 10.3
+HIAWATHA_VERSION = 10.4
 HIAWATHA_SITE = http://www.hiawatha-webserver.org/files
 HIAWATHA_DEPENDENCIES = zlib
 HIAWATHA_LICENSE = GPLv2
