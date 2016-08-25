From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Aug 2016 21:01:03 +0200
Subject: [Buildroot] [git commit] core: move reproducible option to advanced
	sub-menu
Message-ID: <20160825190128.26F0C82125@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ac2cdd7d19796fad22faa114c1e29f8b9d556ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The reproducible build is only in its infancy; it is far from being
complete.

As such, move it to the "advanced" build sub-menu, where it belong for
now...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Config.in b/Config.in
index 741a7ce..ed92c56 100644
--- a/Config.in
+++ b/Config.in
@@ -726,8 +726,6 @@ config BR2_COMPILER_PARANOID_UNSAFE_PATH
 	  toolchain (through the toolchain wrapper and binutils patches)
 	  and external toolchain backends (through the toolchain wrapper).
 
-endmenu
-
 config BR2_REPRODUCIBLE
 	bool "Make the build reproducible (experimental)"
 	help
@@ -741,6 +739,8 @@ config BR2_REPRODUCIBLE
 
 endmenu
 
+endmenu
+
 source "toolchain/Config.in"
 
 source "system/Config.in"
