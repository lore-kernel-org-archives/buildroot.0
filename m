From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 11 Apr 2016 12:27:29 +0200
Subject: [Buildroot] [PATCH 4/5] python-pysmb: bump to version 1.1.18
In-Reply-To: <1460370450-22120-1-git-send-email-yegorslists@googlemail.com>
References: <1460370450-22120-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1460370450-22120-4-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-pysmb/python-pysmb.hash | 6 +++---
 package/python-pysmb/python-pysmb.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pysmb/python-pysmb.hash b/package/python-pysmb/python-pysmb.hash
index b3c91fe..4c41068 100644
--- a/package/python-pysmb/python-pysmb.hash
+++ b/package/python-pysmb/python-pysmb.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=256b94bdeb63e6cc63f4b6a380b5918b, sha256 locally computed
-md5     256b94bdeb63e6cc63f4b6a380b5918b  pysmb-1.1.17.tar.gz
-sha256  267def5aef2f0f41be4ba141b29dce9c23214667e84bddefd285b56fd481d813  pysmb-1.1.17.tar.gz
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=9fe70cbc812b2e789915bedea7e45b1a, sha256 locally computed
+md5     9fe70cbc812b2e789915bedea7e45b1a  pysmb-1.1.18.tar.gz
+sha256  580f7dcf8048656d2924c2f78731feaeaf6f9fa8ef5c251fc6964d39bfd3a6b9  pysmb-1.1.18.tar.gz
diff --git a/package/python-pysmb/python-pysmb.mk b/package/python-pysmb/python-pysmb.mk
index 1a00a4d..51df91d 100644
--- a/package/python-pysmb/python-pysmb.mk
+++ b/package/python-pysmb/python-pysmb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_PYSMB_VERSION = 1.1.17
+PYTHON_PYSMB_VERSION = 1.1.18
 PYTHON_PYSMB_SOURCE = pysmb-$(PYTHON_PYSMB_VERSION).tar.gz
 PYTHON_PYSMB_SITE = https://pypi.python.org/packages/source/p/pysmb
 PYTHON_PYSMB_LICENSE = libpng license
-- 
2.1.4
