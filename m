From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 14 Nov 2012 22:34:45 +0100
Subject: [Buildroot] [git commit] logrotate: add license info
Message-ID: <20121114214729.D8E8C99B26@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0c294a3de61f448a067349ff55d61b2c3adbf27d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/logrotate/logrotate.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index ae622b0..da8e4b3 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -6,6 +6,8 @@
 LOGROTATE_VERSION = 3.7.9
 LOGROTATE_SOURCE = logrotate-$(LOGROTATE_VERSION).tar.gz
 LOGROTATE_SITE = https://fedorahosted.org/releases/l/o/logrotate/
+LOGROTATE_LICENSE = GPLv2+
+LOGROTATE_LICENSE_FILES = COPYING
 
 LOGROTATE_DEPENDENCIES = popt
 
