From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Jun 2017 22:37:02 +0200
Subject: [Buildroot] [git commit] python-paramiko: sort runtime dependencies
	in alphabetical order
Message-ID: <20170615203626.456FF80842@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=385008667ac77e89f8efe6be96c521c6a9c88ee0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-paramiko/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-paramiko/Config.in b/package/python-paramiko/Config.in
index 7d20d04..1f86af3 100644
--- a/package/python-paramiko/Config.in
+++ b/package/python-paramiko/Config.in
@@ -1,12 +1,12 @@
 config BR2_PACKAGE_PYTHON_PARAMIKO
 	bool "python-paramiko"
 	depends on BR2_INSTALL_LIBSTDCPP # python-pyasn
-	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON # runtime
-	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3 # runtime
+	select BR2_PACKAGE_PYTHON_BCRYPT # runtime
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
 	select BR2_PACKAGE_PYTHON_PYASN # runtime
 	select BR2_PACKAGE_PYTHON_PYNACL # runtime
-	select BR2_PACKAGE_PYTHON_BCRYPT # runtime
+	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3 # runtime
 	help
 	  SSH2 protocol library.
 
