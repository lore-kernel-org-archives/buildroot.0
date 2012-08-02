From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 02 Aug 2012 19:54:35 -0000
Subject: [Buildroot] [git commit branch/next] file: remove redundant
	HOST_FILE_DEPENDENCIES
Message-ID: <20120802195249.8C53396EA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6778e78001be1f134a0aa2aa8ab83f6c29dd66f6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/file/file.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

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
