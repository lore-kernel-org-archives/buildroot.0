From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 13 Nov 2012 12:05:58 +0100
Subject: [Buildroot] [PATCH 24/30] strace: add license info
In-Reply-To: <1352804764-24026-1-git-send-email-arnout@mind.be>
References: <1352804764-24026-1-git-send-email-arnout@mind.be>
Message-ID: <1352804764-24026-24-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/strace/strace.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index ad1d042..349dc2c 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -7,6 +7,8 @@
 STRACE_VERSION = 4.7
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = http://downloads.sourceforge.net/project/strace/strace/$(STRACE_VERSION)
+STRACE_LICENSE = BSD-3c
+STRACE_LICENSE_FILES = COPYRIGHT
 
 STRACE_CONF_ENV = ac_cv_header_linux_if_packet_h=yes \
 		  ac_cv_header_linux_netlink_h=yes
-- 
1.7.10.4
