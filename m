From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 14 Jul 2012 22:31:49 +0200
Subject: [Buildroot] [PATCH 2/6] file: remove redundant
	HOST_FILE_DEPENDENCIES
In-Reply-To: <1342297879-9881-1-git-send-email-arnout@mind.be>
References: <1342297879-9881-1-git-send-email-arnout@mind.be>
Message-ID: <1342297909-10672-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
 package/file/file.mk |    1 -
 1 file changed, 1 deletion(-)

diff --git a/package/file/file.mk b/package/file/file.mk
index c9846e4..7f07752 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -7,7 +7,6 @@
 FILE_VERSION = 5.11
 FILE_SITE = ftp://ftp.astron.com/pub/file
 FILE_DEPENDENCIES = host-file zlib
-HOST_FILE_DEPENDENCIES = host-zlib
 FILE_INSTALL_STAGING = YES
 
 define FILE_UNINSTALL_TARGET_CMDS
-- 
tg: (e991c59..) t/host-no-circular-dep-file (depends on: t/host-no-circular-dep)
