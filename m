From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 13 Nov 2012 12:05:48 +0100
Subject: [Buildroot] [PATCH 14/30] lockfile-progs: add license info
In-Reply-To: <1352804764-24026-1-git-send-email-arnout@mind.be>
References: <1352804764-24026-1-git-send-email-arnout@mind.be>
Message-ID: <1352804764-24026-14-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/lockfile-progs/lockfile-progs.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/lockfile-progs/lockfile-progs.mk b/package/lockfile-progs/lockfile-progs.mk
index 333ddce..1c3cb51 100644
--- a/package/lockfile-progs/lockfile-progs.mk
+++ b/package/lockfile-progs/lockfile-progs.mk
@@ -7,6 +7,8 @@ LOCKFILE_PROGS_VERSION = 0.1.15
 LOCKFILE_PROGS_SOURCE = lockfile-progs_$(LOCKFILE_PROGS_VERSION).tar.gz
 LOCKFILE_PROGS_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/l/lockfile-progs/
 LOCKFILE_PROGS_DEPENDENCIES = liblockfile
+LOCKFILE_PROGS_LICENSE = GPLv2
+LOCKFILE_PROGS_LICENSE_FILES = COPYING
 
 LOCKFILE_BINS = \
 	$(addprefix lockfile-,check create remove touch) \
-- 
1.7.10.4
