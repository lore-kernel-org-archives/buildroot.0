From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri, 16 Dec 2016 16:02:52 +0100
Subject: [Buildroot] [PATCH 6/6] python-pytablewriter: bump to version 0.14.1
In-Reply-To: <1481900572-7854-1-git-send-email-yegorslists@googlemail.com>
References: <1481900572-7854-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1481900572-7854-6-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-pytablewriter/python-pytablewriter.hash | 4 ++--
 package/python-pytablewriter/python-pytablewriter.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pytablewriter/python-pytablewriter.hash b/package/python-pytablewriter/python-pytablewriter.hash
index 09fb8ff..097d0ed 100644
--- a/package/python-pytablewriter/python-pytablewriter.hash
+++ b/package/python-pytablewriter/python-pytablewriter.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/pytablewriter/json, sha256 locally computed
-md5	1f63f9652c61c0d68f17dac054d2c923  pytablewriter-0.10.2.tar.gz
-sha256	9a45c632ffd94878153cb989ada412b7291100005ce40baaf33a3d4bd51708cf  pytablewriter-0.10.2.tar.gz
+md5	0c45bc31cec49d462fcae16ac3a494d2  pytablewriter-0.14.1.tar.gz
+sha256	7147f12b58ab6506488fc7cd5719dc73f4c03aafaecd5fe7d378297ea5758eaa  pytablewriter-0.14.1.tar.gz
diff --git a/package/python-pytablewriter/python-pytablewriter.mk b/package/python-pytablewriter/python-pytablewriter.mk
index bf89d0a..f86c51e 100644
--- a/package/python-pytablewriter/python-pytablewriter.mk
+++ b/package/python-pytablewriter/python-pytablewriter.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTABLEWRITER_VERSION = 0.10.2
+PYTHON_PYTABLEWRITER_VERSION = 0.14.1
 PYTHON_PYTABLEWRITER_SOURCE = pytablewriter-$(PYTHON_PYTABLEWRITER_VERSION).tar.gz
-PYTHON_PYTABLEWRITER_SITE = https://pypi.python.org/packages/eb/4f/ca66fd21db4d9ef81f8bb2012dece42a1f5239295df149a04d955e492fc5
+PYTHON_PYTABLEWRITER_SITE = https://pypi.python.org/packages/cb/f7/5000d900ddc927300cc4d8492e06f87a79f830a463bea459b3e03ad6742b
 PYTHON_PYTABLEWRITER_SETUP_TYPE = setuptools
 PYTHON_PYTABLEWRITER_LICENSE = MIT
 PYTHON_PYTABLEWRITER_LICENSE_FILES = LICENSE
-- 
2.1.4
