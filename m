From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Feb 2017 09:43:41 +0100
Subject: [Buildroot] [git commit] babeld: fix typo in variable name
Message-ID: <20170207090318.92F717FA5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b2cf7ca0e2fd9763ec566c3e8808f08dcb9391d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As pointed out during the check-package discussion, there is a typo in a
variable name:

http://lists.busybox.net/pipermail/buildroot/2016-December/180765.html

Fixing that also shows that the license file was misspelled, so fix that as
well (LICENSE/LICENCE).

Reported-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/babeld/babeld.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/babeld/babeld.mk b/package/babeld/babeld.mk
index ca39c71..d718237 100644
--- a/package/babeld/babeld.mk
+++ b/package/babeld/babeld.mk
@@ -6,8 +6,8 @@
 
 BABELD_VERSION = 1.7.1
 BABELD_SITE = http://www.pps.univ-paris-diderot.fr/~jch/software/files
-BALELD_LICENSE = MIT
-BALELD_LICENSE_FILES = LICENSE
+BABELD_LICENSE = MIT
+BABELD_LICENSE_FILES = LICENCE
 
 define BABELD_BUILD_CMDS
 	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
