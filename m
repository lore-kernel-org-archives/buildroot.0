From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 13 Nov 2012 12:06:02 +0100
Subject: [Buildroot] [PATCH 28/30] valgrind: add license info
In-Reply-To: <1352804764-24026-1-git-send-email-arnout@mind.be>
References: <1352804764-24026-1-git-send-email-arnout@mind.be>
Message-ID: <1352804764-24026-28-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/valgrind/valgrind.mk |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index 05f402f..cdebbec 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -7,6 +7,9 @@
 VALGRIND_VERSION = 3.7.0
 VALGRIND_SITE    = http://valgrind.org/downloads/
 VALGRIND_SOURCE  = valgrind-$(VALGRIND_VERSION).tar.bz2
+VALGRIND_LICENSE = GPLv2 GFDLv1.2
+VALGRIND_LICENSE_FILES = COPYING COPYING.DOCS
+
 VALGRIND_CONF_OPT = --disable-tls
 
 # On ARM, Valgrind only supports ARMv7, and uses the arch part of the
-- 
1.7.10.4
