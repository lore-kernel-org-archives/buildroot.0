From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Feb 2014 09:02:07 +0100
Subject: [Buildroot] [git commit branch/next] python-pycrypto: allow to
	build with Python 3
Message-ID: <20140219080356.331B99CAA7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=255d51f76c82110226bfd61315e3b890ca8d9f4d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pycrypto/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/python-pycrypto/Config.in b/package/python-pycrypto/Config.in
index 60a3446..fe545b5 100644
--- a/package/python-pycrypto/Config.in
+++ b/package/python-pycrypto/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYCRYPTO
 	bool "python-pycrypto"
-	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_GMP
 	help
 	  PyCrypto is a collection of cryptographic algorithms and
