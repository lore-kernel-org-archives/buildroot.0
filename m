From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed, 16 Mar 2016 16:41:49 +0100
Subject: [Buildroot] [PATCH 4/4] python-mistune: bump to version 0.7.2
In-Reply-To: <1458142909-26392-1-git-send-email-yegorslists@googlemail.com>
References: <1458142909-26392-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1458142909-26392-4-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-mistune/python-mistune.hash | 6 +++---
 package/python-mistune/python-mistune.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-mistune/python-mistune.hash b/package/python-mistune/python-mistune.hash
index b161e11..8509606 100644
--- a/package/python-mistune/python-mistune.hash
+++ b/package/python-mistune/python-mistune.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=057bc28bf629d6a1283d680a34ed9d0f, sha256 locally computed.
-md5	057bc28bf629d6a1283d680a34ed9d0f  mistune-0.7.1.tar.gz
-sha256	6076dedf768348927d991f4371e5a799c6a0158b16091df08ee85ee231d929a7  mistune-0.7.1.tar.gz
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=ed9ac03c99261bd1803e44ddaa4f87cb, sha256 locally computed.
+md5	ed9ac03c99261bd1803e44ddaa4f87cb  mistune-0.7.2.tar.gz
+sha256	626f2516adcde4af608eaf83635ff20ff7e577c1898ad4d0f0fcd8c094399840  mistune-0.7.2.tar.gz
diff --git a/package/python-mistune/python-mistune.mk b/package/python-mistune/python-mistune.mk
index a1e5710..f0301a7 100644
--- a/package/python-mistune/python-mistune.mk
+++ b/package/python-mistune/python-mistune.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_MISTUNE_VERSION = 0.7.1
+PYTHON_MISTUNE_VERSION = 0.7.2
 PYTHON_MISTUNE_SOURCE = mistune-$(PYTHON_MISTUNE_VERSION).tar.gz
 PYTHON_MISTUNE_SITE = http://pypi.python.org/packages/source/m/mistune
 PYTHON_MISTUNE_LICENSE = BSD-3c
-- 
2.7.0
