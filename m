From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 7 Jun 2013 10:54:00 +0200
Subject: [Buildroot] [git commit] Fix package headers to comply with coding
	style
Message-ID: <20130607090525.49ABE9A9FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=834de0ac1316e8f8cbaf8f75712a7476526995a6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/cramfs/cramfs.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/fs/cramfs/cramfs.mk b/fs/cramfs/cramfs.mk
index 6549f39..4f737dd 100644
--- a/fs/cramfs/cramfs.mk
+++ b/fs/cramfs/cramfs.mk
@@ -3,6 +3,7 @@
 # Build the cramfs root filesystem image
 #
 #############################################################
+
 ifeq ($(BR2_ENDIAN),"BIG")
 CRAMFS_OPTS=-b
 else
