From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 29 May 2012 09:55:13 +0200
Subject: [Buildroot] [git commit branch/next] ofono: bump version
Message-ID: <20120529075858.E435D96E06@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=41b2e7d9f9f1dc5c36567dec9aeaff6d0bf04003
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ofono/ofono.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
index c49ee29..c6ffb64 100644
--- a/package/ofono/ofono.mk
+++ b/package/ofono/ofono.mk
@@ -3,7 +3,7 @@
 # ofono
 #
 #############################################################
-OFONO_VERSION = 1.5
+OFONO_VERSION = 1.6
 OFONO_SITE = $(BR2_KERNEL_MIRROR)/linux/network/ofono
 OFONO_DEPENDENCIES = \
 	host-pkg-config \
