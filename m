From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Jan 2021 15:56:07 +0100
Subject: [Buildroot] [git commit branch/2020.02.x]
 docs/manual/pkg-cmake.txt: add _INSTALL_OPTS description
Message-ID: <20210119143958.17241883B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0fc67aa4c7242bdc80b8c4282891045f52565276
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 93daabcfbd8df17ea6f9943de34579e82dc41d00)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-cmake.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/docs/manual/adding-packages-cmake.txt b/docs/manual/adding-packages-cmake.txt
index 00974d30d8..73f0943024 100644
--- a/docs/manual/adding-packages-cmake.txt
+++ b/docs/manual/adding-packages-cmake.txt
@@ -126,6 +126,11 @@ typical packages will therefore only use a few of them.
   in the build step. These are passed after the +make+ command. By
   default, empty.
 
+* +LIBFOO_INSTALL_OPTS+ contains the make options used to
+  install the package to the host directory. By default, the value
+  is +install+, which is correct for most CMake packages. It is still
+  possible to override it.
+
 * +LIBFOO_INSTALL_STAGING_OPTS+ contains the make options used to
   install the package to the staging directory. By default, the value
   is +DESTDIR=$(STAGING_DIR) install/fast+, which is correct for most
