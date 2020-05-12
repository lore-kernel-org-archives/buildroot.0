From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 May 2020 09:59:39 +0200
Subject: [Buildroot] [git commit] package/python-future: fix dependency
Message-ID: <20200512082850.C5E01914C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2f3fc105877b506ef7ae0db91e7d4598cbb67704
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python-future does not depends on python2.
The package work with python 3.x.

Signed-off-by: Louis Aussedat <aussedat.louis@gmail.com>
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
 
