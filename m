From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri, 13 Jan 2017 09:43:06 +0100
Subject: [Buildroot] [PATCH 1/2] python-urwid: bump to version 1.3.1
Message-ID: <1484296987-18842-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-urwid/python-urwid.hash | 6 +++---
 package/python-urwid/python-urwid.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-urwid/python-urwid.hash b/package/python-urwid/python-urwid.hash
index eceed9d..c600851 100644
--- a/package/python-urwid/python-urwid.hash
+++ b/package/python-urwid/python-urwid.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi/urwid/1.3.0, sha256 locally computed
-md5	a989acd54f4ff1a554add464803a9175  urwid-1.3.0.tar.gz
-sha256	29f04fad3bf0a79c5491f7ebec2d50fa086e9d16359896c9204c6a92bc07aba2  urwid-1.3.0.tar.gz
+# md5 from https://pypi.python.org/pypi/urwid/json, sha256 locally computed
+md5	2e1a005cb31368fe21bfeba2d6ad5a5c  urwid-1.3.1.tar.gz
+sha256	cfcec03e36de25a1073e2e35c2c7b0cc6969b85745715c3a025a31d9786896a1  urwid-1.3.1.tar.gz
diff --git a/package/python-urwid/python-urwid.mk b/package/python-urwid/python-urwid.mk
index 1cd3022..e52a155 100644
--- a/package/python-urwid/python-urwid.mk
+++ b/package/python-urwid/python-urwid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_URWID_VERSION = 1.3.0
+PYTHON_URWID_VERSION = 1.3.1
 PYTHON_URWID_SOURCE = urwid-$(PYTHON_URWID_VERSION).tar.gz
 PYTHON_URWID_SITE = https://pypi.python.org/packages/source/u/urwid
 PYTHON_URWID_LICENSE = LGPLv2.1+
-- 
2.1.4
