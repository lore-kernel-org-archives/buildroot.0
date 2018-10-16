From: Asaf Kahlon <asafka7@gmail.com>
Date: Tue, 16 Oct 2018 21:05:14 +0300
Subject: [Buildroot] [PATCH 1/1] python-markdown2: bump to version 2.3.6
Message-ID: <20181016180514.6055-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add license hash.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-markdown2/python-markdown2.hash | 3 ++-
 package/python-markdown2/python-markdown2.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/python-markdown2/python-markdown2.hash b/package/python-markdown2/python-markdown2.hash
index 17ae7d901d..59a9a13ad1 100644
--- a/package/python-markdown2/python-markdown2.hash
+++ b/package/python-markdown2/python-markdown2.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256	07e077f5d4aa5f1e2f061f9f94d9e22f9ea266411b8c557b9164fc0e6dff0595  python-markdown2-2.3.2.tar.gz
+sha256	53a6100ee005df09d0462cc246f8dc7cd48f4678d1074f36e7cff980a3819b48  python-markdown2-2.3.6.tar.gz
+sha256	f8c7c4d554409cf621b8d653dbfffb719745fd36f5c49b8305258649b403ef9c  LICENSE.txt
diff --git a/package/python-markdown2/python-markdown2.mk b/package/python-markdown2/python-markdown2.mk
index 1e343b43ff..8069ef9185 100644
--- a/package/python-markdown2/python-markdown2.mk
+++ b/package/python-markdown2/python-markdown2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_MARKDOWN2_VERSION = 2.3.2
+PYTHON_MARKDOWN2_VERSION = 2.3.6
 PYTHON_MARKDOWN2_SITE = $(call github,trentm,python-markdown2,$(PYTHON_MARKDOWN2_VERSION))
 PYTHON_MARKDOWN2_SETUP_TYPE = distutils
 PYTHON_MARKDOWN2_LICENSE = MIT
-- 
2.17.1
