From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Oct 2013 00:07:39 +0200
Subject: [Buildroot] [git commit] ola: bump to version 0.8.32
Message-ID: <20131023222547.DDD619BB7A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=945468045fe1a0b67fd67f3674f29cacfdce0c24
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ola/ola.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ola/ola.mk b/package/ola/ola.mk
index d7ddab7..835ca4e 100644
--- a/package/ola/ola.mk
+++ b/package/ola/ola.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OLA_VERSION = 0.8.31
+OLA_VERSION = 0.8.32
 OLA_SITE = https://open-lighting.googlecode.com/files
 
 OLA_LICENSE = LGPLv2.1+ (libola, libolacommon, Python bindings), GPLv2+ (libolaserver, olad, Python examples and tests)
