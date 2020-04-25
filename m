From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 25 Apr 2020 09:08:51 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/python-flask:
 remove erroneously python-lxml dependency
Message-ID: <20200425065640.36E4E8FC47@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=edcebfba7323ec3a129d721976142ae694e08c79
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Remove erroneously python-lxml dependency (as noted by
Peter Korsgaard).

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Reviewed-by: S??bastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ebc55329cb7f7dda52b54afab140cfca5d1f8dc5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-flask/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python-flask/Config.in b/package/python-flask/Config.in
index 72fcb61999..556afab6d2 100644
--- a/package/python-flask/Config.in
+++ b/package/python-flask/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_PYTHON_FLASK
 	bool "python-flask"
 	select BR2_PACKAGE_PYTHON_CLICK # runtime
 	select BR2_PACKAGE_PYTHON_JINJA2 # runtime
-	select BR2_PACKAGE_PYTHON_LXML # runtime
 	select BR2_PACKAGE_PYTHON_WERKZEUG # runtime
 	select BR2_PACKAGE_PYTHON_ITSDANGEROUS # runtime
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
