From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 May 2019 09:26:21 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/python-gunicorn:
 replace utf-8 quote by ascii single quote
Message-ID: <20190526072357.D6EF28E14E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b3b2e05274858fd65d08e11b6a316dc012e4ab15
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit fc5a3d9d842ba8f913cdfa2415cf971ef2ac4bbf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-gunicorn/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-gunicorn/Config.in b/package/python-gunicorn/Config.in
index 098c3fa6b0..518157bf93 100644
--- a/package/python-gunicorn/Config.in
+++ b/package/python-gunicorn/Config.in
@@ -3,8 +3,8 @@ config BR2_PACKAGE_PYTHON_GUNICORN
 	select BR2_PACKAGE_PYTHON_SSL if BR2_PACKAGE_PYTHON # runtime
 	select BR2_PACKAGE_PYTHON3_SSL if BR2_PACKAGE_PYTHON3 # runtime
 	help
-	  Gunicorn ???Green Unicorn??? is a Python WSGI HTTP Server for
-	  UNIX. It???s a pre-fork worker model ported from Ruby???s
+	  Gunicorn 'Green Unicorn' is a Python WSGI HTTP Server for
+	  UNIX. It's a pre-fork worker model ported from Ruby's
 	  Unicorn project. The Gunicorn server is broadly compatible
 	  with various web frameworks, simply implemented, light on
 	  server resource usage, and fairly speedy.
