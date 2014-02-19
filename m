From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Feb 2014 09:01:49 +0100
Subject: [Buildroot] [git commit branch/next] python-serial: allow to build
	with Python 3
Message-ID: <20140219080355.E7BB399B3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2696d9c04528b88a53ddd70f1d625e2fca31a1f8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-serial/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/python-serial/Config.in b/package/python-serial/Config.in
index df26af1..72f5567 100644
--- a/package/python-serial/Config.in
+++ b/package/python-serial/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_SERIAL
 	bool "python-serial"
-	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	help
 	  python-serial is a Python library to access serial ports.
 
