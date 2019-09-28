From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 28 Sep 2019 06:31:04 -0600
Subject: [Buildroot] [PATCH 1/1] DEVELOPERS: fix syntax error
Message-ID: <20190928123104.55549-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index c5132df788..e0a61c45c4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -54,7 +54,7 @@ F:	package/openjdk-bin/
 F:	package/php/
 F:	package/policycoreutils/
 F:	package/python3/
-F!	package/python-asgiref/
+F:	package/python-asgiref/
 F:	package/python-django-enumfields/
 F:	package/python-flask-sqlalchemy/
 F:	package/python-mutagen/
-- 
2.20.1
