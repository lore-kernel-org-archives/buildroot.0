From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Jul 2015 22:49:51 +0200
Subject: [Buildroot] [git commit] package/libfslparser: remove autoreconf
Message-ID: <20150720205435.64EA181E4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0f2bc9d1763e4a67afcf329a571100fcc1cc9906
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

autoreconf is not needed anymore with the current
version (4.0.2).

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libfslparser/libfslparser.mk |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/package/libfslparser/libfslparser.mk b/package/libfslparser/libfslparser.mk
index 50f0bf6..116a0a2 100644
--- a/package/libfslparser/libfslparser.mk
+++ b/package/libfslparser/libfslparser.mk
@@ -20,7 +20,4 @@ endef
 # The Makefile installs several versions of the libraries, but we only
 # need one of them, depending on the platform.
 
-# without AUTORECONF, configure fails to find install-sh.
-LIBFSLPARSER_AUTORECONF = YES
-
 $(eval $(autotools-package))
