From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 May 2019 09:27:53 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/python-pexpect:
 replace utf-8 apostrophe by ascii single quote
Message-ID: <20190526072357.EEC718E14E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae93e5463e977a820c4ea32280e51a52fa76c4ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 7c3d8667feecd50efc1c8ff70cf586fe2ef7b112)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
-	  patterns in their output. Pexpect works like Don Libes???
+	  patterns in their output. Pexpect works like Don Libes'
 	  Expect. Pexpect allows your script to spawn a child
 	  application and control it as if a human were typing
 	  commands.
