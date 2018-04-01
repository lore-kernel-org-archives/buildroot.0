From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 10:09:52 +0200
Subject: [Buildroot] [git commit] package/*/Config.in: re-wrap help text
Message-ID: <20180401081003.48CB3827E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=73f77570076db97ba2bdcf93fb84d348d278389a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

... to follow the convention <tab><2 spaces><62 chars>.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-functools32/Config.in | 4 ++--
 package/python-jsonmodels/Config.in  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-functools32/Config.in b/package/python-functools32/Config.in
index cc12557edc..606341d828 100644
--- a/package/python-functools32/Config.in
+++ b/package/python-functools32/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_PYTHON_FUNCTOOLS32
 	bool "python-functools32"
 	depends on BR2_PACKAGE_PYTHON
 	help
-	  Backport of the functools module from Python 3.2.3 for use on 2.7
-	  and PyPy.
+	  Backport of the functools module from Python 3.2.3 for use on
+	  2.7 and PyPy.
 
 	  https://github.com/MiCHiLU/python-functools32
diff --git a/package/python-jsonmodels/Config.in b/package/python-jsonmodels/Config.in
index d840e2acfe..f66982874a 100644
--- a/package/python-jsonmodels/Config.in
+++ b/package/python-jsonmodels/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_PYTHON_JSONMODELS
 	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
-	  Models to make easier to deal with structures that are converted
-	  to, or read from JSON.
+	  Models to make easier to deal with structures that are
+	  converted to, or read from JSON.
 
 	  https://github.com/beregond/jsonmodels
