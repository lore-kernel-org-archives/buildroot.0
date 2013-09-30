From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 30 Sep 2013 22:46:33 +0200
Subject: [Buildroot] [git commit] monit: bump version to 5.6
Message-ID: <20130930204717.792449B8ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=97ee2406e1b1f6fb2d6ac5df996872f58e6a3254
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/monit/monit.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/monit/monit.mk b/package/monit/monit.mk
index e2847fc..ec7c95d 100644
--- a/package/monit/monit.mk
+++ b/package/monit/monit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONIT_VERSION = 5.4
+MONIT_VERSION = 5.6
 MONIT_SITE = http://mmonit.com/monit/dist/
 MONIT_LICENSE = AGPLv3 with OpenSSL exception
 MONIT_LICENSE_FILES = COPYING
