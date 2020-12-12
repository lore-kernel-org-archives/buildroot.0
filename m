From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Sat, 12 Dec 2020 16:26:02 +0100
Subject: [Buildroot] [PATCH 1/2] package/python-pyparsing: update link to
 project
Message-ID: <20201212152603.53957-1-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Old link no longer works, so replace that with link to GitHub.

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
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
-- 
2.29.2
