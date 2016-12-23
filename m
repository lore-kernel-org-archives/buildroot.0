From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Dec 2016 14:59:40 +0100
Subject: [Buildroot] [git commit] python-lxml: bump to version 3.7.0
Message-ID: <20161223142516.2E1DD819EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3477a7520b155eb2f98c56834794f6bea7e688cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-lxml/python-lxml.hash | 2 +-
 package/python-lxml/python-lxml.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-lxml/python-lxml.hash b/package/python-lxml/python-lxml.hash
index 656c01f..cab3e37 100644
--- a/package/python-lxml/python-lxml.hash
+++ b/package/python-lxml/python-lxml.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  61d5d3e00b5821e6cda099b3b4ccfea4527bf7c595e0fb3a7a760490cedd6172  lxml-3.6.4.tgz
+sha256  9c62eb2a1862e1ae285d7e7e3b7dc8772d387b19258086afcec143c6b7b8a5c9  lxml-3.7.0.tgz
diff --git a/package/python-lxml/python-lxml.mk b/package/python-lxml/python-lxml.mk
index b117ec8..6495351 100644
--- a/package/python-lxml/python-lxml.mk
+++ b/package/python-lxml/python-lxml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_LXML_VERSION = 3.6.4
+PYTHON_LXML_VERSION = 3.7.0
 PYTHON_LXML_SITE = http://lxml.de/files
 PYTHON_LXML_SOURCE = lxml-$(PYTHON_LXML_VERSION).tgz
 
