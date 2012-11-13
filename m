From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 13 Nov 2012 12:06:04 +0100
Subject: [Buildroot] [PATCH 30/30] xenomai: add license info
In-Reply-To: <1352804764-24026-1-git-send-email-arnout@mind.be>
References: <1352804764-24026-1-git-send-email-arnout@mind.be>
Message-ID: <1352804764-24026-30-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/xenomai/xenomai.mk |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index e425b75..f40cbdc 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -12,6 +12,9 @@ endif
 
 XENOMAI_SITE = http://download.gna.org/xenomai/stable/
 XENOMAI_SOURCE = xenomai-$(XENOMAI_VERSION).tar.bz2
+XENOMAI_LICENSE = headers: GPLv2+ with exception, libraries: LGPLv2.1+, kernel: GPLv2+, docs: GFDLv1.2+, ipipe patch and can driver: GPLv2
+# GFDL is not included but refers to gnu.org
+XENOMAI_LICENSE_FILES = debian/copyright include/COPYING src/skins/native/COPYING ksrc/nucleus/COPYING
 
 XENOMAI_INSTALL_STAGING = YES
 
-- 
1.7.10.4
