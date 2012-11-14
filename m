From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 14 Nov 2012 22:36:23 +0100
Subject: [Buildroot] [git commit] openntpd: add license info
Message-ID: <20121114214731.9CD0099B26@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c4030d3acf64c338eb7c4f8b77508fc7762bfcab
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/openntpd/openntpd.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/openntpd/openntpd.mk b/package/openntpd/openntpd.mk
index f63a9c6..fab68b6 100644
--- a/package/openntpd/openntpd.mk
+++ b/package/openntpd/openntpd.mk
@@ -7,6 +7,8 @@
 OPENNTPD_VERSION = 3.9p1
 OPENNTPD_SITE = ftp://ftp.openbsd.org/pub/OpenBSD/OpenNTPD
 OPENNTPD_CONF_OPT = --with-builtin-arc4random --disable-strip
+OPENNTPD_LICENSE = MIT-like, BSD-2c, BSD-3c
+OPENNTPD_LICENSE_FILES = LICENCE
 
 define OPENNTPD_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/sbin/ntpd
