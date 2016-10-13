From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Oct 2016 08:07:13 +0200
Subject: [Buildroot] [git commit] python-pytablewriter: add missing
	python-xlwt dependency
Message-ID: <20161013060802.860A87FCE9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e54540ec710cf9e7d0f0bccc68ddb811eb73365c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since version 0.6.0 pytablewriter requires xlwt package too.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
