From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 30 Nov 2012 07:28:18 -0800
Subject: [Buildroot] [git commit] libmad: add license info
Message-ID: <20121130154710.6935799369@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=069eccfc7185ebb514f0f1822ddfc8dd261a8841
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: license is GPLv2+ as pointed out by Arnout]
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libmad/libmad.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libmad/libmad.mk b/package/libmad/libmad.mk
index d9ce0ae..09f3cdb 100644
--- a/package/libmad/libmad.mk
+++ b/package/libmad/libmad.mk
@@ -8,6 +8,8 @@ LIBMAD_VERSION = 0.15.1b
 LIBMAD_SITE = http://downloads.sourceforge.net/project/mad/libmad/$(LIBMAD_VERSION)
 LIBMAD_INSTALL_STAGING = YES
 LIBMAD_LIBTOOL_PATCH = NO
+LIBMAD_LICENSE = GPLv2+
+LIBMAD_LICENSE_FILES = COPYING
 
 define LIBMAD_PREVENT_AUTOMAKE
 	# Prevent automake from running.
