From: Daniel Fahlgren <daniel@fahlgren.se>
Date: Tue,  6 Nov 2018 15:06:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-posix-ipc: enable also for
 python3
In-Reply-To: <20181106121459.24903-1-daniel@fahlgren.se>
References: <20181106121459.24903-1-daniel@fahlgren.se>
Message-ID: <20181106140631.710-1-daniel@fahlgren.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The python-posix-ipc package can be used both with python2 and python3.

Signed-off-by: Daniel Fahlgren <daniel@fahlgren.se>
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
-- 
2.14.1
