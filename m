From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Aug 2014 23:52:36 +0200
Subject: [Buildroot] [git commit branch/next] chrony: bump version
Message-ID: <20140812231338.9509D9CE21@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=21a85fd02a093a13675209bc82fd7e69462ecfc6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
