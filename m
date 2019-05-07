From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  7 May 2019 22:35:38 +0200
Subject: [Buildroot] [PATCH v1 18/28] package/python-gunicorn: replace utf-8
 quote by ascii single quote
In-Reply-To: <20190507203548.10337-1-ps.report@gmx.net>
References: <20190507203548.10337-1-ps.report@gmx.net>
Message-ID: <20190507203548.10337-18-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
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
-	  Gunicorn ?Green Unicorn? is a Python WSGI HTTP Server for
-	  UNIX. It?s a pre-fork worker model ported from Ruby?s
+	  Gunicorn 'Green Unicorn' is a Python WSGI HTTP Server for
+	  UNIX. It's a pre-fork worker model ported from Ruby's
 	  Unicorn project. The Gunicorn server is broadly compatible
 	  with various web frameworks, simply implemented, light on
 	  server resource usage, and fairly speedy.
--
2.21.0
