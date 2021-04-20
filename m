From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 20 Apr 2021 21:29:41 +0200
Subject: [Buildroot] [git commit] package/python-botocore: drop docutils
 dependency
Message-ID: <20210420190414.5CDEB83D02@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=34764dcfac4a319c4a0812496b31f922570f41c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

docutils is not a dependency since version 1.18.0 and
https://github.com/boto/botocore/commit/dd24dd1b2ee8654ae0cf6aebce4a2f50ea7d75f5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-botocore/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python-botocore/Config.in b/package/python-botocore/Config.in
index a552900b6c..f34d774f95 100644
--- a/package/python-botocore/Config.in
+++ b/package/python-botocore/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_PYTHON_BOTOCORE
 	bool "python-botocore"
 	select BR2_PACKAGE_PYTHON_JMESPATH # runtime
-	select BR2_PACKAGE_PYTHON_DOCUTILS # runtime
 	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
 	select BR2_PACKAGE_PYTHON_URLLIB3 # runtime
 	help
