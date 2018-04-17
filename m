From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Apr 2018 14:57:05 +0200
Subject: [Buildroot] [git commit] package/python-xlrd: fix check-package
 warnings on Config.in.host
Message-ID: <20180417125749.8FEBC80FBA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=da24b31f93dc3e7ac91a6d764ce649fbce1115c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

package/python-xlrd/Config.in.host:4: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)

https://gitlab.com/buildroot.org/buildroot/-/jobs/63334884

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-xlrd/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-xlrd/Config.in.host b/package/python-xlrd/Config.in.host
index 493592562c..cd98fd4da3 100644
--- a/package/python-xlrd/Config.in.host
+++ b/package/python-xlrd/Config.in.host
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_HOST_PYTHON_XLRD
 	bool "host python-xlrd"
 	help
-	  Library for developers to extract data from Microsoft Excel (tm)
-	  spreadsheet files.
+	  Library for developers to extract data from Microsoft
+	  Excel(tm) spreadsheet files.
 
 	  http://www.python-excel.org/
