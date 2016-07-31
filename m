From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Jul 2016 20:16:45 +0200
Subject: [Buildroot] [git commit] yasm: add license
Message-ID: <20160731183025.1E45681D8A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6b669897e0ce6d8b8064794ea2202c66e3ab2614
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/yasm/yasm.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/yasm/yasm.mk b/package/yasm/yasm.mk
index 6729b6a..1980034 100644
--- a/package/yasm/yasm.mk
+++ b/package/yasm/yasm.mk
@@ -6,6 +6,8 @@
 
 YASM_VERSION = 1.3.0
 YASM_SITE = http://www.tortall.net/projects/yasm/releases
+YASM_LICENSE = BSD-2c, BSD-3c, Artistic, GPLv2, LGPLv2
+YASM_LICENSE_FILES = COPYING BSD.txt Artistic.txt GNU_GPL-2.0 GNU_LGPL-2.0
 
 # This sed prevents it compiling 2 programs (vsyasm and ytasm)
 # that are only of use on Microsoft Windows.
