From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Oct 2013 15:00:24 +0200
Subject: [Buildroot] [git commit] dmidecode: bump to version 2.12
Message-ID: <20131004130855.B10489B93F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4c921006688a19f94f139ad1ef1e8d5523c48ebd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dmidecode/dmidecode.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dmidecode/dmidecode.mk b/package/dmidecode/dmidecode.mk
index 86a3be5..c53bd33 100644
--- a/package/dmidecode/dmidecode.mk
+++ b/package/dmidecode/dmidecode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DMIDECODE_VERSION = 2.11
+DMIDECODE_VERSION = 2.12
 DMIDECODE_SITE    = http://download.savannah.gnu.org/releases/dmidecode/
 
 define DMIDECODE_BUILD_CMDS
