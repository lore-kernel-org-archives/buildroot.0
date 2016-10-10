From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 10 Oct 2016 08:12:30 +0200
Subject: [Buildroot] [PATCH] python-pytablewriter: add missing python-xlwt
	dependency
Message-ID: <1476079950-22759-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Since version 0.6.0 pytablewriter requires xlwt package too.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-pytablewriter/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pytablewriter/Config.in b/package/python-pytablewriter/Config.in
index 6c19745..d889161 100644
--- a/package/python-pytablewriter/Config.in
+++ b/package/python-pytablewriter/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_PYTHON_PYTABLEWRITER
 	select BR2_PACKAGE_PYTHON_PATHVALIDATE # runtime
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_XLSXWRITER # runtime
+	select BR2_PACKAGE_PYTHON_XLWT # runtime
 	help
 	  pytablewriter is a python library to write a table in various
 	  formats: CSV, HTML, JavaScript, JSON, Markdown, Excel, Pandas,
-- 
2.1.4
