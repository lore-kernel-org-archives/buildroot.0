From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Jul 2012 12:36:23 +0200
Subject: [Buildroot] [git commit] file: remove redundant
	HOST_FILE_DEPENDENCIES
Message-ID: <20120715103641.64DC090EA4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6778e78001be1f134a0aa2aa8ab83f6c29dd66f6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
