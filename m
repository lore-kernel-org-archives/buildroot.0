From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jan 2017 22:57:16 +1300
Subject: [Buildroot] [git commit] python-pytablewriter: bump to version
	0.17.1
Message-ID: <20170124095725.092647FB3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ff596afccf3e4ab59f19553c6f0f1a4c00117567
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new dependencies: python-toml and python-pytablereader.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pytablewriter/Config.in                 | 2 ++
 package/python-pytablewriter/python-pytablewriter.hash | 4 ++--
 package/python-pytablewriter/python-pytablewriter.mk   | 4 ++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/python-pytablewriter/Config.in b/package/python-pytablewriter/Config.in
index d889161..f270d0d 100644
--- a/package/python-pytablewriter/Config.in
+++ b/package/python-pytablewriter/Config.in
@@ -6,6 +6,8 @@ config BR2_PACKAGE_PYTHON_PYTABLEWRITER
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_XLSXWRITER # runtime
 	select BR2_PACKAGE_PYTHON_XLWT # runtime
+	select BR2_PACKAGE_PYTHON_TOML # runtime
+	select BR2_PACKAGE_PYTHON_PYTABLEREADER # runtime
 	help
 	  pytablewriter is a python library to write a table in various
 	  formats: CSV, HTML, JavaScript, JSON, Markdown, Excel, Pandas,
diff --git a/package/python-pytablewriter/python-pytablewriter.hash b/package/python-pytablewriter/python-pytablewriter.hash
index 097d0ed..3b5bef3 100644
--- a/package/python-pytablewriter/python-pytablewriter.hash
+++ b/package/python-pytablewriter/python-pytablewriter.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/pytablewriter/json, sha256 locally computed
-md5	0c45bc31cec49d462fcae16ac3a494d2  pytablewriter-0.14.1.tar.gz
-sha256	7147f12b58ab6506488fc7cd5719dc73f4c03aafaecd5fe7d378297ea5758eaa  pytablewriter-0.14.1.tar.gz
+md5	7b909647bb8a87373f2553a6fccdf419  pytablewriter-0.17.1.tar.gz
+sha256	20c58c41359941262bf288d2fe81ca506e2a38cfdd337d982dbcb2e26ec4a3ed  pytablewriter-0.17.1.tar.gz
diff --git a/package/python-pytablewriter/python-pytablewriter.mk b/package/python-pytablewriter/python-pytablewriter.mk
index f86c51e..6d2e545 100644
--- a/package/python-pytablewriter/python-pytablewriter.mk
+++ b/package/python-pytablewriter/python-pytablewriter.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTABLEWRITER_VERSION = 0.14.1
+PYTHON_PYTABLEWRITER_VERSION = 0.17.1
 PYTHON_PYTABLEWRITER_SOURCE = pytablewriter-$(PYTHON_PYTABLEWRITER_VERSION).tar.gz
-PYTHON_PYTABLEWRITER_SITE = https://pypi.python.org/packages/cb/f7/5000d900ddc927300cc4d8492e06f87a79f830a463bea459b3e03ad6742b
+PYTHON_PYTABLEWRITER_SITE = https://pypi.python.org/packages/a2/2f/093dded4e265705c1d87d68a9062acb69b39c6ec615f74d71c62f6625afa
 PYTHON_PYTABLEWRITER_SETUP_TYPE = setuptools
 PYTHON_PYTABLEWRITER_LICENSE = MIT
 PYTHON_PYTABLEWRITER_LICENSE_FILES = LICENSE
