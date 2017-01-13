From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri, 13 Jan 2017 09:43:07 +0100
Subject: [Buildroot] [PATCH 2/2] python-lxml: bump to version 3.7.2
In-Reply-To: <1484296987-18842-1-git-send-email-yegorslists@googlemail.com>
References: <1484296987-18842-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1484296987-18842-2-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-lxml/python-lxml.hash | 2 +-
 package/python-lxml/python-lxml.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-lxml/python-lxml.hash b/package/python-lxml/python-lxml.hash
index cab3e37..a1dc093 100644
--- a/package/python-lxml/python-lxml.hash
+++ b/package/python-lxml/python-lxml.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  9c62eb2a1862e1ae285d7e7e3b7dc8772d387b19258086afcec143c6b7b8a5c9  lxml-3.7.0.tgz
+sha256  59d9176360dbc3919e9d4bfca85c1ca64ab4f4ee00e6f119d7150ba887e3410a  lxml-3.7.2.tgz
diff --git a/package/python-lxml/python-lxml.mk b/package/python-lxml/python-lxml.mk
index 6495351..62c2980 100644
--- a/package/python-lxml/python-lxml.mk
+++ b/package/python-lxml/python-lxml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_LXML_VERSION = 3.7.0
+PYTHON_LXML_VERSION = 3.7.2
 PYTHON_LXML_SITE = http://lxml.de/files
 PYTHON_LXML_SOURCE = lxml-$(PYTHON_LXML_VERSION).tgz
 
-- 
2.1.4
