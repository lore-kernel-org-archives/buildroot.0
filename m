From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 24 Mar 2015 20:50:50 +0100
Subject: [Buildroot] [PATCH 2/2] python-lxml: bump to 3.4.2
In-Reply-To: <1427226650-3208-1-git-send-email-yegorslists@googlemail.com>
References: <1427226650-3208-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1427226650-3208-2-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-lxml/python-lxml.hash | 2 +-
 package/python-lxml/python-lxml.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-lxml/python-lxml.hash b/package/python-lxml/python-lxml.hash
index 470a245..e5d5766 100644
--- a/package/python-lxml/python-lxml.hash
+++ b/package/python-lxml/python-lxml.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  069594837d0376a1bacf5cc42aa9a1be2e1c1396dc62f7d07f7358afecd34adf  lxml-3.4.1.tgz
+sha256  c7d5990298af6ffb00312973a25f0cc917a6368126dd40eaab41d78d3e1ea25d  lxml-3.4.2.tgz
diff --git a/package/python-lxml/python-lxml.mk b/package/python-lxml/python-lxml.mk
index e7222e8..5dcc4ca 100644
--- a/package/python-lxml/python-lxml.mk
+++ b/package/python-lxml/python-lxml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_LXML_VERSION = 3.4.1
+PYTHON_LXML_VERSION = 3.4.2
 PYTHON_LXML_SITE = http://lxml.de/files
 PYTHON_LXML_SOURCE = lxml-$(PYTHON_LXML_VERSION).tgz
 
-- 
2.1.0
