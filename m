From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 11 Apr 2016 12:27:27 +0200
Subject: [Buildroot] [PATCH 2/5] python-click: bump to version 6.6
In-Reply-To: <1460370450-22120-1-git-send-email-yegorslists@googlemail.com>
References: <1460370450-22120-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1460370450-22120-2-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-click/python-click.hash | 6 +++---
 package/python-click/python-click.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-click/python-click.hash b/package/python-click/python-click.hash
index 72aab0a..c0d0568 100644
--- a/package/python-click/python-click.hash
+++ b/package/python-click/python-click.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=83252a8095397b1f5f710fdd58b484d9, sha256 locally computed.
-md5	83252a8095397b1f5f710fdd58b484d9  click-6.2.tar.gz
-sha256	fba0ff70f5ebb4cebbf64c40a8fbc222fb7cf825237241e548354dabe3da6a82  click-6.2.tar.gz
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=d0b09582123605220ad6977175f3e51d, sha256 locally computed.
+md5	d0b09582123605220ad6977175f3e51d  click-6.6.tar.gz
+sha256	cc6a19da8ebff6e7074f731447ef7e112bd23adf3de5c597cf9989f2fd8defe9  click-6.6.tar.gz
diff --git a/package/python-click/python-click.mk b/package/python-click/python-click.mk
index 19ae187..839a467 100644
--- a/package/python-click/python-click.mk
+++ b/package/python-click/python-click.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_CLICK_VERSION = 6.2
+PYTHON_CLICK_VERSION = 6.6
 PYTHON_CLICK_SOURCE = click-$(PYTHON_CLICK_VERSION).tar.gz
 PYTHON_CLICK_SITE = http://pypi.python.org/packages/source/c/click
 PYTHON_CLICK_LICENSE = BSD-3c
-- 
2.1.4
