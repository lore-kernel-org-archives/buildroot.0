From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  7 May 2019 23:30:23 +0200
Subject: [Buildroot] [PATCH v1 21/28] package/python-pexpect: replace utf-8
 apostrophe by ascii single quote
Message-ID: <20190507213030.1542-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/python-pexpect/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pexpect/Config.in b/package/python-pexpect/Config.in
index 58a3af5783..cee4606c1b 100644
--- a/package/python-pexpect/Config.in
+++ b/package/python-pexpect/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_PYTHON_PEXPECT
 	help
 	  Pexpect is a pure Python module for spawning child
 	  applications; controlling them; and responding to expected
-	  patterns in their output. Pexpect works like Don Libes?
+	  patterns in their output. Pexpect works like Don Libes'
 	  Expect. Pexpect allows your script to spawn a child
 	  application and control it as if a human were typing
 	  commands.
--
2.21.0
