From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Sep 2014 13:24:46 -0000
Subject: [Buildroot] [git commit] chrony: bump version
Message-ID: <20140901132445.ACE239D5B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=21a85fd02a093a13675209bc82fd7e69462ecfc6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/chrony/chrony.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index afe0fc8..59e5bfc 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHRONY_VERSION = 1.29.1
+CHRONY_VERSION = 1.30
 CHRONY_SITE = http://download.tuxfamily.org/chrony
 CHRONY_LICENSE = GPLv2
 CHRONY_LICENSE_FILES = COPYING
