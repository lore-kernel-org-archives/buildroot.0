From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Feb 2014 09:01:55 +0100
Subject: [Buildroot] [git commit] python-pyasn: allow to build with Python 3
Message-ID: <20140228133414.E792C9BA7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=69adc069f0e1924d04233cde5db14b74bd8e00a0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pyasn/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/python-pyasn/Config.in b/package/python-pyasn/Config.in
index 13095f9..eca53db 100644
--- a/package/python-pyasn/Config.in
+++ b/package/python-pyasn/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYASN
 	bool "python-pyasn"
-	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  PyASN is a Python extension module that enables you to
