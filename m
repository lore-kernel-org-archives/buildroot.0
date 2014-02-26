From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Feb 2014 11:24:57 +0100
Subject: [Buildroot] [git commit branch/next] monit: bump to version 5.7
Message-ID: <20140226102631.8F14B9BA8A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=14dc1ef762e365fe5a7535c416adbbdecc21199f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

CHANGES version 5.7:
https://mmonit.com/monit/dist/CHANGES.txt

Signed-off-by: Johan Derycke <johan.derycke@barco.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/monit/monit.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/monit/monit.mk b/package/monit/monit.mk
index ec7c95d..3fdc17e 100644
--- a/package/monit/monit.mk
+++ b/package/monit/monit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONIT_VERSION = 5.6
+MONIT_VERSION = 5.7
 MONIT_SITE = http://mmonit.com/monit/dist/
 MONIT_LICENSE = AGPLv3 with OpenSSL exception
 MONIT_LICENSE_FILES = COPYING
