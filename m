From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 21 Apr 2013 23:17:57 +0200
Subject: [Buildroot] [git commit] monit: add license information
Message-ID: <20130421212043.69CBC9B782@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=559e00b6308b60a51e1423b8b1192f11b32183f3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/monit/monit.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/monit/monit.mk b/package/monit/monit.mk
index a8b6447..657f0f1 100644
--- a/package/monit/monit.mk
+++ b/package/monit/monit.mk
@@ -6,6 +6,8 @@
 
 MONIT_VERSION = 5.4
 MONIT_SITE = http://mmonit.com/monit/dist/
+MONIT_LICENSE = AGPLv3 with OpenSSL exception
+MONIT_LICENSE_FILES = COPYING
 
 MONIT_CONF_ENV = \
 	libmonit_cv_setjmp_available=yes \
