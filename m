From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 8 May 2014 21:55:18 +0200
Subject: [Buildroot] [git commit] libcec: Bump version
Message-ID: <20140508200413.67F3D9CB3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=37b2613dfe95e0aad50b97e3d9d7ff9a1d9ef137
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcec/libcec.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
index 99cc767..0aabb06 100644
--- a/package/libcec/libcec.mk
+++ b/package/libcec/libcec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCEC_VERSION = libcec-2.1.1
+LIBCEC_VERSION = libcec-2.1.4-repack
 LIBCEC_SITE = $(call github,Pulse-Eight,libcec,$(LIBCEC_VERSION))
 LIBCEC_LICENSE = GPLv2+
 LIBCEC_LICENSE_FILES = COPYING
