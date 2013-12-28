From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Dec 2013 15:58:56 +0100
Subject: [Buildroot] [git commit] logrotate: bump to version 3.8.7
Message-ID: <20131228145904.32A889C221@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aa83bc88ba4c738daaf944c1b2a7d00001d05a67
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/logrotate/logrotate.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index 516fe8b..a41e074 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LOGROTATE_VERSION = 3.8.6
+LOGROTATE_VERSION = 3.8.7
 LOGROTATE_SITE = https://www.fedorahosted.org/releases/l/o/logrotate/
 LOGROTATE_LICENSE = GPLv2+
 LOGROTATE_LICENSE_FILES = COPYING
