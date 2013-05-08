From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 8 May 2013 12:17:13 +0200
Subject: [Buildroot] [git commit] patch: fix license information
Message-ID: <20130508112313.661FC99E6F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=288b5493588ee82e65f277be03dd678806306ab5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/patch/patch.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/patch/patch.mk b/package/patch/patch.mk
index badc431..5a421c7 100644
--- a/package/patch/patch.mk
+++ b/package/patch/patch.mk
@@ -7,6 +7,6 @@
 PATCH_VERSION = 2.7.1
 PATCH_SITE = $(BR2_GNU_MIRROR)/patch
 PATCH_LICENSE = GPLv3+
-PATCH_LICENSE_FILE = COPYING
+PATCH_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
