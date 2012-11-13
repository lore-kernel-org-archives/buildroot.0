From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 13 Nov 2012 12:05:40 +0100
Subject: [Buildroot] [PATCH 06/30] dropbear: add license info
In-Reply-To: <1352804764-24026-1-git-send-email-arnout@mind.be>
References: <1352804764-24026-1-git-send-email-arnout@mind.be>
Message-ID: <1352804764-24026-6-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/dropbear/dropbear.mk |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index 64d3a01..bd45221 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -10,6 +10,9 @@ DROPBEAR_TARGET_BINS = dbclient dropbearkey dropbearconvert scp ssh
 DROPBEAR_MAKE =	$(MAKE) MULTI=1 SCPPROGRESS=1 \
 		PROGRAMS="dropbear dbclient dropbearkey dropbearconvert scp"
 
+DROPBEAR_LICENSE = MIT, BSD-2c-like, BSD-2c
+DROPBEAR_LICENSE_FILES = LICENSE
+
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
 DROPBEAR_MAKE += STATIC=1
 endif
-- 
1.7.10.4
