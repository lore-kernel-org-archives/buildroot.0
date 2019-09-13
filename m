From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 13 Sep 2019 22:29:06 +0200
Subject: [Buildroot] [git commit] package/jo: bump to version 1.2
Message-ID: <20190913202456.2FD2D8E117@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8e2845eb1a8673975a55ec554dfcb5639327363e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop the v prefix on the download URL as the 1.2 git tag is just '1.2' and
add a hash for the license file.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/jo/jo.hash | 3 ++-
 package/jo/jo.mk   | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/jo/jo.hash b/package/jo/jo.hash
index 736b0fb8fb..eb5555957f 100644
--- a/package/jo/jo.hash
+++ b/package/jo/jo.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 63ed4766c2e0fcb5391a14033930329369f437d7060a11d82874e57e278bda5f  jo-1.1.tar.gz
+sha256 36ec2fc4937c6478467684b18f0b213ff7267d34f5626cd5a0996a39ca64adae  jo-1.2.tar.gz
+sha256 41d8b23dc6e76731f4920b9ce42d0d4a248d243a510319e2441d174a115f35cf  COPYING
diff --git a/package/jo/jo.mk b/package/jo/jo.mk
index ad085b29f2..854140de59 100644
--- a/package/jo/jo.mk
+++ b/package/jo/jo.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-JO_VERSION = 1.1
-JO_SITE = https://github.com/jpmens/jo/releases/download/v$(JO_VERSION)
+JO_VERSION = 1.2
+JO_SITE = https://github.com/jpmens/jo/releases/download/$(JO_VERSION)
 JO_LICENSE = MIT (json.[ch]), GPL-2.0+ (rest)
 JO_LICENSE_FILES = COPYING
 # don't build man pages
