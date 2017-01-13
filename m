From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Jan 2017 16:08:16 +0100
Subject: [Buildroot] [git commit] python-lxml: bump to version 3.7.2
Message-ID: <20170113152114.337F481EC2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=94e03d5aa15f4eec7f1123996710051d57557df2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
