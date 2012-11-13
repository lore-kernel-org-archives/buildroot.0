From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 13 Nov 2012 12:05:44 +0100
Subject: [Buildroot] [PATCH 10/30] libffi: add license info
In-Reply-To: <1352804764-24026-1-git-send-email-arnout@mind.be>
References: <1352804764-24026-1-git-send-email-arnout@mind.be>
Message-ID: <1352804764-24026-10-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libffi/libffi.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
index 81ac043..7570583 100644
--- a/package/libffi/libffi.mk
+++ b/package/libffi/libffi.mk
@@ -6,6 +6,8 @@
 
 LIBFFI_VERSION = 3.0.11
 LIBFFI_SITE    = ftp://sources.redhat.com/pub/libffi/
+LIBFFI_LICENSE = MIT
+LIBFFI_LICENSE_FILES = LICENSE
 
 LIBFFI_INSTALL_STAGING = YES
 
-- 
1.7.10.4
