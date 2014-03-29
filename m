From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 23:46:28 +0100
Subject: [Buildroot] [git commit] dtv-scan-tables: use a slightly older
	commit hash
Message-ID: <20140329224728.0A7DC9C436@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=19760253bb1a4bd6102300576db5ded1c3823856
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The commit hash chosen by Yann exists in the repository accessible by
git://, but not the one accessible by http://, which is lagging 3
commits behind the git:// repository, for some reason.

For the time being, revert to the latest commit available in the
http:// repository.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dtv-scan-tables/dtv-scan-tables.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dtv-scan-tables/dtv-scan-tables.mk b/package/dtv-scan-tables/dtv-scan-tables.mk
index 2797321..470db8c 100644
--- a/package/dtv-scan-tables/dtv-scan-tables.mk
+++ b/package/dtv-scan-tables/dtv-scan-tables.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DTV_SCAN_TABLES_VERSION = cfc29758d1357b724f3bf27c3b1b277e242841fa
+DTV_SCAN_TABLES_VERSION = 7809ca1c04e688f35d09b8c1b2ac9b8ef4865322
 DTV_SCAN_TABLES_SITE = http://linuxtv.org/git/dtv-scan-tables.git
 DTV_SCAN_TABLES_SITE_METHOD = git
 
