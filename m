From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 12 May 2013 22:17:24 +0200
Subject: [Buildroot] [git commit] libsha1: add license informations
Message-ID: <20130512202410.1E24F9A164@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=48ac24985c0dcf37c1951da9f7f4d4ae18ee1266
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libsha1/libsha1.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/libsha1/libsha1.mk b/package/libsha1/libsha1.mk
index e9658af..da6a7b2 100644
--- a/package/libsha1/libsha1.mk
+++ b/package/libsha1/libsha1.mk
@@ -6,6 +6,9 @@
 
 LIBSHA1_VERSION = 0.3
 LIBSHA1_SITE = http://github.com/dottedmag/libsha1/tarball/$(LIBSHA1_VERSION)
+LIBSHA1_LICENSE = BSD-3c or GPL
+LIBSHA1_LICENSE_FILES = COPYING
+
 LIBSHA1_INSTALL_STAGING = YES
 
 # We're getting the source code from Github, so there is no generated
