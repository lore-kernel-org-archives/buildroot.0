From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 Nov 2018 23:07:54 +0100
Subject: [Buildroot] [git commit] package/python-posix-ipc: enable also for
 python3
Message-ID: <20181107220554.43A7E815BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1182a8baeffb699a60011c8dab2eed3faa2cbcbf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The python-posix-ipc package can be used both with python2 and python3.

Signed-off-by: Daniel Fahlgren <daniel@fahlgren.se>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-posix-ipc/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python-posix-ipc/Config.in b/package/python-posix-ipc/Config.in
index eba36edd7b..2c62678679 100644
--- a/package/python-posix-ipc/Config.in
+++ b/package/python-posix-ipc/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_POSIX_IPC
 	bool "python-posix-ipc"
-	depends on BR2_PACKAGE_PYTHON
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  The Python extension module posix_ipc gives access to POSIX
