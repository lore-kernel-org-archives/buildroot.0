From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:58:04 -0000
Subject: [Buildroot] [git commit branch/next] package/wipe: remove autoreconf
Message-ID: <20150808105638.795D5803C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1768b5f97426395d8cc2c2cc1de6c914e9fffd7b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

A configure script is already bundled in the archive.
There is no comment why autoreconf was added.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wipe/wipe.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/wipe/wipe.mk b/package/wipe/wipe.mk
index 38cb434..9ec7faf 100644
--- a/package/wipe/wipe.mk
+++ b/package/wipe/wipe.mk
@@ -7,7 +7,6 @@
 WIPE_VERSION = 2.3.1
 WIPE_SITE = http://downloads.sourceforge.net/project/wipe/wipe/$(WIPE_VERSION)
 WIPE_SOURCE = wipe-$(WIPE_VERSION).tar.bz2
-WIPE_AUTORECONF = YES
 WIPE_LICENSE = GPLv2+
 WIPE_LICENSE_FILES = LICENSE
 
