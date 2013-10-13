From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 14 Oct 2013 01:11:27 +0200
Subject: [Buildroot] [PATCH 3/4] Makefile: export BUILD_DIR
In-Reply-To: <cover.1381705600.git.yann.morin.1998@free.fr>
References: <cover.1381705600.git.yann.morin.1998@free.fr>
Message-ID: <834cf660ddc6216e486f97195f464f0e6125774e.1381705600.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

$(BUILD_DIR) is a nice place to put files generated during the build.
With the advent of user-supplied step-hooks, they may want to store
some information on the build.

Export BUILD_DIR to that effect.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index f266e2d..9528703 100644
--- a/Makefile
+++ b/Makefile
@@ -291,6 +291,7 @@ export STAGING_DIR
 export HOST_DIR
 export BINARIES_DIR
 export BASE_DIR
+export BUILD_DIR
 
 ################################################################################
 #
-- 
1.8.1.2
