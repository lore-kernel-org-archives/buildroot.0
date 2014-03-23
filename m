From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Mar 2014 20:52:20 +0100
Subject: [Buildroot] [git commit] manual/customize-packages.txt: reword part
	about applying patches
Message-ID: <20140323195541.DE8E39C218@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5f1335f0c80170f5b570a0830cada5392236979d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/customize-packages.txt |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/manual/customize-packages.txt b/docs/manual/customize-packages.txt
index 5e622f1..f141b7e 100644
--- a/docs/manual/customize-packages.txt
+++ b/docs/manual/customize-packages.txt
@@ -59,9 +59,9 @@ directory.
 The exception to +BR2_GLOBAL_PATCH_DIR+ being the preferred method for
 specifying custom patches is +BR2_LINUX_KERNEL_PATCH+.
 +BR2_LINUX_KERNEL_PATCH+ should be used to specify kernel patches that
-are available at an URL. *Note:* +BR2_LINUX_KERNEL_PATCHES+ are applied
-after patches available in +BR2_GLOBAL_PATCH_DIR+, as it is done
-from a post-patch hook of the Linux package.
+are available at an URL. *Note:* +BR2_LINUX_KERNEL_PATCH+ specifies kernel
+patches that are applied after patches available in +BR2_GLOBAL_PATCH_DIR+,
+as it is done from a post-patch hook of the Linux package.
 
 An example directory structure for where a user has multiple
 directories specified for +BR2_GLOBAL_PATCH_DIR+ may look like this:
