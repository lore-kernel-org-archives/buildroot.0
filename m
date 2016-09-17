From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Sep 2016 14:46:04 +0200
Subject: [Buildroot] [git commit] docs/manual: update pkg-kconfig doc about
	<pkg>_KCONFIG_DOTCONFIG
Message-ID: <20160917131555.59B0480767@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4309092e34586274f58599e006725b70ead53d9c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Content provided by Yann E. Morin.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-kconfig.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/docs/manual/adding-packages-kconfig.txt b/docs/manual/adding-packages-kconfig.txt
index 3290024..d4d8630 100644
--- a/docs/manual/adding-packages-kconfig.txt
+++ b/docs/manual/adding-packages-kconfig.txt
@@ -75,3 +75,9 @@ be set to suit the needs of the package under consideration:
   configuration file after copying it or running a kconfig editor. Such
   commands may be needed to ensure a configuration consistent with other
   configuration of Buildroot, for example. By default, empty.
+
+* +FOO_KCONFIG_DOTCONFIG+: path (with filename) of the +.config+ file,
+  relative to the package source tree. The default, +.config+, should
+  be well suited for all packages that use the standard kconfig
+  infrastructure as inherited from the Linux kernel; some packages use
+  a derivative of kconfig that use a different location.
