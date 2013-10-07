From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 7 Oct 2013 11:53:44 +0200
Subject: [Buildroot] [git commit] sudo: bump to version 1.8.8
Message-ID: <20131007095748.178D09B8ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ef162c24f03655050ef294d3e89f8f5fd2106d89
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sudo/sudo.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 661d858..e0db465 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUDO_VERSION = 1.8.6p7
+SUDO_VERSION = 1.8.8
 SUDO_SITE    = http://www.sudo.ws/sudo/dist
 SUDO_LICENSE = ICS BSD-3c
 SUDO_LICENSE_FILES = doc/LICENSE
