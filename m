From: Mark Corbin <mark@dibsco.co.uk>
Date: Thu, 28 Nov 2019 11:49:44 +0000
Subject: [Buildroot] [PATCH 1/1] package/liberation: add an upstream URL to
 Config.in
Message-ID: <20191128114944.26074-1-mark@dibsco.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
---
 package/liberation/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/liberation/Config.in b/package/liberation/Config.in
index b68166f638..8d6b3e78d9 100644
--- a/package/liberation/Config.in
+++ b/package/liberation/Config.in
@@ -5,6 +5,8 @@ config BR2_PACKAGE_LIBERATION
 	  three most commonly used fonts on Microsoft systems:
 	  Times New Roman, Arial, and Courier New.
 
+	  https://github.com/liberationfonts/liberation-fonts
+
 if BR2_PACKAGE_LIBERATION
 
 config BR2_PACKAGE_LIBERATION_MONO
-- 
2.20.1
