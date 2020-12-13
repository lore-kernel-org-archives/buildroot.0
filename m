From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 13 Dec 2020 11:17:30 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/python-pyparsing:
 update link to project
Message-ID: <20201213101012.3401982215@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=53b53b01ae77619740ac9419b3e942f1e7d0b853
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Old link no longer works, so replace that with link to GitHub.

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1cec1e3f7f7a2412d2d4b29abe984d78b10cd269)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pyparsing/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pyparsing/Config.in b/package/python-pyparsing/Config.in
index 425ffe326b..926ca07ed7 100644
--- a/package/python-pyparsing/Config.in
+++ b/package/python-pyparsing/Config.in
@@ -7,4 +7,4 @@ config BR2_PACKAGE_PYTHON_PYPARSING
 	  module provides a library of classes that client code uses
 	  to construct the grammar directly in Python code.
 
-	  http://pyparsing.wikispaces.com/
+	  https://github.com/pyparsing/pyparsing/
