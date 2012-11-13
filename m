From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 13 Nov 2012 12:05:53 +0100
Subject: [Buildroot] [PATCH 19/30] openntpd: add license info
In-Reply-To: <1352804764-24026-1-git-send-email-arnout@mind.be>
References: <1352804764-24026-1-git-send-email-arnout@mind.be>
Message-ID: <1352804764-24026-19-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
There is one license that I didn't include in the summary (but it's in
the license file):
"It may be used for any purpose as long as this notice remains intact
on all source code distributions."
Since the whole work is also covered by the much stronger BSD and MIT
licenses, I think it's OK to leave this out from the summary.  The
details are anyway in the full license text.
---
 package/openntpd/openntpd.mk |    2 ++
 1 file changed, 2 insertions(+)

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
-- 
1.7.10.4
