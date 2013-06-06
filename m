From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 6 Jun 2013 16:50:18 +0200
Subject: [Buildroot] [git commit] xfsprogs: Version bump to 3.1.11
Message-ID: <20130606145221.847459A1ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d0d8a53dda3a5a757ae892b803bf25647be10aae
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/xfsprogs/xfsprogs.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk
index 532e8c0..823bf39 100644
--- a/package/xfsprogs/xfsprogs.mk
+++ b/package/xfsprogs/xfsprogs.mk
@@ -3,7 +3,7 @@
 # xfsprogs
 #
 #############################################################
-XFSPROGS_VERSION = 3.1.8
+XFSPROGS_VERSION = 3.1.11
 XFSPROGS_SITE=ftp://oss.sgi.com/projects/xfs/cmd_tars
 
 XFSPROGS_DEPENDENCIES = util-linux
