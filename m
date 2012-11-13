From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 13 Nov 2012 12:05:45 +0100
Subject: [Buildroot] [PATCH 11/30] liblockfile: add license info
In-Reply-To: <1352804764-24026-1-git-send-email-arnout@mind.be>
References: <1352804764-24026-1-git-send-email-arnout@mind.be>
Message-ID: <1352804764-24026-11-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/liblockfile/liblockfile.mk |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/liblockfile/liblockfile.mk b/package/liblockfile/liblockfile.mk
index 037983e..84b0212 100644
--- a/package/liblockfile/liblockfile.mk
+++ b/package/liblockfile/liblockfile.mk
@@ -8,6 +8,9 @@ LIBLOCKFILE_SOURCE:=liblockfile_$(LIBLOCKFILE_VERSION).orig.tar.gz
 LIBLOCKFILE_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/libl/liblockfile/
 LIBLOCKFILE_PATCH:=liblockfile_$(LIBLOCKFILE_VERSION)-4.debian.tar.bz2
 
+LIBLOCKFILE_LICENSE = LGPLv2+, dotlockfile GPLv2+
+# No license file included, it refers to the gnu.org website
+
 LIBLOCKFILE_INSTALL_STAGING = YES
 LIBLOCKFILE_CONF_OPT = --mandir=/usr/share/man
 
-- 
1.7.10.4
