From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 May 2020 12:57:39 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/python-future:
 fix dependency
Message-ID: <20200512104437.7492D914DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d207477392dde79749a114ddd04352a9fd200c4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

python-future does not depends on python2.
The package work with python 3.x.

Signed-off-by: Louis Aussedat <aussedat.louis@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2f3fc105877b506ef7ae0db91e7d4598cbb67704)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-future/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python-future/Config.in b/package/python-future/Config.in
index 29303f334d..8a3fd38f36 100644
--- a/package/python-future/Config.in
+++ b/package/python-future/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_FUTURE
 	bool "python-future"
-	depends on BR2_PACKAGE_PYTHON
 	help
 	  Easy, clean, reliable Python 2/3 compatibility.
 
