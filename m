From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 25 Apr 2012 08:52:29 +0200
Subject: [Buildroot] [git commit] Remove unused GNU_TARGET_SUFFIX
Message-ID: <20120425065435.599A796BCA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ad5af7573291e48835d52223642505a2f8d18af2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index eafb654..44c70cc 100644
--- a/Makefile
+++ b/Makefile
@@ -236,8 +236,6 @@ BZCAT:=$(call qstrip,$(BR2_BZCAT))
 XZCAT:=$(call qstrip,$(BR2_XZCAT))
 TAR_OPTIONS=$(call qstrip,$(BR2_TAR_OPTIONS)) -xf
 
-GNU_TARGET_SUFFIX:=-$(call qstrip,$(BR2_GNU_TARGET_SUFFIX))
-
 # packages compiled for the host go here
 HOST_DIR:=$(call qstrip,$(BR2_HOST_DIR))
 
