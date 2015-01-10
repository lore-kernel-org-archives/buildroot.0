From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jan 2015 11:49:51 +0100
Subject: [Buildroot] [git commit] newt: bump version to 0.52.18
Message-ID: <20150110105031.AEBB37FC1B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d8ceb223fe629b2877da97855381444961843f39
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/newt/newt.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/newt/newt.mk b/package/newt/newt.mk
index d11a534..4c5d241 100644
--- a/package/newt/newt.mk
+++ b/package/newt/newt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NEWT_VERSION = 0.52.17
+NEWT_VERSION = 0.52.18
 NEWT_SITE = https://fedorahosted.org/releases/n/e/newt
 NEWT_INSTALL_STAGING = YES
 NEWT_DEPENDENCIES = popt slang \
