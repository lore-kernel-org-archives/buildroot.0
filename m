From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Aug 2012 19:42:19 +0200
Subject: [Buildroot] [git commit] inotify-tools: add license information
Message-ID: <20120822174958.A102897268@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a05a1cc16b9b306fe21a8117e00f80a54151a267
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/inotify-tools/inotify-tools.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/inotify-tools/inotify-tools.mk b/package/inotify-tools/inotify-tools.mk
index 52a1701..b53efad 100644
--- a/package/inotify-tools/inotify-tools.mk
+++ b/package/inotify-tools/inotify-tools.mk
@@ -5,4 +5,7 @@
 #############################################################
 INOTIFY_TOOLS_VERSION = 3.14
 INOTIFY_TOOLS_SITE = http://github.com/downloads/rvoicilas/inotify-tools/
+INOTIFY_TOOLS_LICENSE = GPLv2+
+INOTIFY_TOOLS_LICENSE_FILES = COPYING
+
 $(eval $(autotools-package))
