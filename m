From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Apr 2020 10:13:43 +0200
Subject: [Buildroot] [git commit] package/python-flask: remove erroneously
 python-lxml dependency
Message-ID: <20200411081600.7E8398E4BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ebc55329cb7f7dda52b54afab140cfca5d1f8dc5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove erroneously python-lxml dependency (as noted by
Peter Korsgaard).

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Reviewed-by: S??bastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
