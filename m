From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Aug 2012 23:21:16 +0200
Subject: [Buildroot] [git commit] inotify-tools: fix license
Message-ID: <20120822212214.068149726D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b502930374bb6b179d4cfb42bf1db06e051bc8fd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No specific GPL version is declared, so it defaults to "any version
ever published", as clause 9 of the GPLv2 states.

Fixes a05a1cc16b9b3.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/inotify-tools/inotify-tools.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/inotify-tools/inotify-tools.mk b/package/inotify-tools/inotify-tools.mk
index b53efad..deb8a8c 100644
--- a/package/inotify-tools/inotify-tools.mk
+++ b/package/inotify-tools/inotify-tools.mk
@@ -5,7 +5,7 @@
 #############################################################
 INOTIFY_TOOLS_VERSION = 3.14
 INOTIFY_TOOLS_SITE = http://github.com/downloads/rvoicilas/inotify-tools/
-INOTIFY_TOOLS_LICENSE = GPLv2+
+INOTIFY_TOOLS_LICENSE = GPL
 INOTIFY_TOOLS_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
