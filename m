From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Jul 2014 17:15:52 +0200
Subject: [Buildroot] [git commit] Makefile: add BR2_DL_DIR to EXTRA_ENV
Message-ID: <20140702152823.900979D144@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=48cb42e7346a6ef30a32a1924b4e5a6705322f81
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also export BR2_DL_DIR for incoming download helper scripts.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Makefile.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 0233506..97053ba 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -305,6 +305,7 @@ HOST_MAKE_ENV=PATH=$(BR_PATH) \
 # post-images)
 EXTRA_ENV=\
 	PATH=$(BR_PATH) \
+	BR2_DL_DIR=$(BR2_DL_DIR) \
 	BUILD_DIR=$(BUILD_DIR)
 
 ################################################################################
