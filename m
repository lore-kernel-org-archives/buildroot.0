From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 May 2019 09:15:46 +0200
Subject: [Buildroot] [git commit] package/python-prompt-toolkit: replace
 utf-8 space by ascii character
Message-ID: <20190508073739.8179D80E33@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c1c7ecab7530e1819df59058c7949719b8244caf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replace utf-8 NO-BREAK-SPACE (c2 a0) in comment line by simple
ascii space character.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-prompt-toolkit/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-prompt-toolkit/Config.in b/package/python-prompt-toolkit/Config.in
index baafaeb8c1..1066e166d9 100644
--- a/package/python-prompt-toolkit/Config.in
+++ b/package/python-prompt-toolkit/Config.in
@@ -2,8 +2,8 @@ config BR2_PACKAGE_PYTHON_PROMPT_TOOLKIT
 	bool "python-prompt-toolkit"
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_WCWIDTH # runtime
-	select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON #??runtime
-	select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3 #??runtime
+	select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3 # runtime
 	help
 	  Library for building powerful interactive command lines in
 	  Python.
