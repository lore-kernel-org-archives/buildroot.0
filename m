From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Dec 2013 10:59:41 +0100
Subject: [Buildroot] [git commit] subversion: bump to version 1.7.14
Message-ID: <20131222100014.D27719C146@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3bbaee01d627f408ba69a8d3febf6db5261e6a57
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upgrade to latest security-related bugfixes release.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/subversion/subversion.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/subversion/subversion.mk b/package/subversion/subversion.mk
index de4db7c..6eb3218 100644
--- a/package/subversion/subversion.mk
+++ b/package/subversion/subversion.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUBVERSION_VERSION = 1.7.9
+SUBVERSION_VERSION = 1.7.14
 SUBVERSION_SITE = http://archive.apache.org/dist/subversion
 SUBVERSION_LICENSE = Apache 2.0
 SUBVERSION_LICENSE_FILES = LICENSE
