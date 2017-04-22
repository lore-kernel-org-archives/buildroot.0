From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Apr 2017 14:28:39 +0200
Subject: [Buildroot] [git commit] e2fsprogs: change into menuconfig
Message-ID: <20170422122853.DB09F81935@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a1849efd1ac9e0a614ebc2fd266441a45417aa21
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We decided some time ago that config entries with 5 or more suboptions
should be turned into a menuconfig. e2fsprogs has many more than that.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/e2fsprogs/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
index c83f845..055ad50 100644
--- a/package/e2fsprogs/Config.in
+++ b/package/e2fsprogs/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_E2FSPROGS
+menuconfig BR2_PACKAGE_E2FSPROGS
 	bool "e2fsprogs"
 	depends on BR2_USE_MMU # util-linux/libblkid
 	select BR2_PACKAGE_UTIL_LINUX
