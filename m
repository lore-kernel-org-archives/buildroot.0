From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Nov 2014 19:06:27 +0100
Subject: [Buildroot] [git commit] python-netifaces: enable on Python 3
Message-ID: <20141201104837.614B17FC49@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=47667497ec2622263bbd3cacc109beed7e7bea7c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Version 0.10.4 is compatible with python 3.

[Thomas: change the patch to simply remove the dependency on
BR2_PACKAGE_PYTHON, so that the package can be seen when either python
or python3 are used.]

Signed-off-by: Simon Marchi <simon.marchi@polymtl.ca>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-netifaces/Config.in |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/python-netifaces/Config.in b/package/python-netifaces/Config.in
index 29f9fc3..1f54f4b 100644
--- a/package/python-netifaces/Config.in
+++ b/package/python-netifaces/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_NETIFACES
 	bool "python-netifaces"
-	depends on BR2_PACKAGE_PYTHON
 	help
 	  Portable access to network interfaces from Python.
 
