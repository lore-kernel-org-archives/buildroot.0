From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Mar 2019 17:36:39 +0100
Subject: [Buildroot] [git commit] package/python-terminaltables: wrap
 Config.in help text
Message-ID: <20190317163412.7CDBE8EC65@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3d9eb78df6b294b22164fc807be98d345e9cd469
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following check-package error:

package/python-terminaltables/Config.in:4: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-terminaltables/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/python-terminaltables/Config.in b/package/python-terminaltables/Config.in
index bb3c51c48f..8f3c4296ed 100644
--- a/package/python-terminaltables/Config.in
+++ b/package/python-terminaltables/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_TERMINALTABLES
 	bool "python-terminaltables"
 	help
-	  Generate simple tables in terminals from a nested list of strings.
+	  Generate simple tables in terminals from a nested list of
+	  strings.
 
 	  https://github.com/Robpol86/terminaltables
