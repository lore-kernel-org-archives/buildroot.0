From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 13 Nov 2012 12:05:46 +0100
Subject: [Buildroot] [PATCH 12/30] libtool: add license info
In-Reply-To: <1352804764-24026-1-git-send-email-arnout@mind.be>
References: <1352804764-24026-1-git-send-email-arnout@mind.be>
Message-ID: <1352804764-24026-12-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libtool/libtool.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libtool/libtool.mk b/package/libtool/libtool.mk
index 4b9657c..0934ffe 100644
--- a/package/libtool/libtool.mk
+++ b/package/libtool/libtool.mk
@@ -7,6 +7,8 @@ LIBTOOL_VERSION = 2.2.10
 LIBTOOL_SOURCE = libtool-$(LIBTOOL_VERSION).tar.gz
 LIBTOOL_SITE = $(BR2_GNU_MIRROR)/libtool
 LIBTOOL_INSTALL_STAGING = YES
+LIBTOOL_LICENSE = GPLv2+
+LIBTOOL_LICENSE_FILES = COPYING
 
 HOST_LIBTOOL_LIBTOOL_PATCH = NO
 
-- 
1.7.10.4
