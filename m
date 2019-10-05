From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 5 Oct 2019 16:46:24 +0200
Subject: [Buildroot] [git commit] package/python-markdown2: bump to version
 2.3.8
Message-ID: <20191005150349.BB46A88454@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7c1f45c194ec922a641a58e5495cdebe6f71cefc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update setup type to setuptools.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-markdown2/python-markdown2.hash | 6 ++++--
 package/python-markdown2/python-markdown2.mk   | 7 ++++---
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/python-markdown2/python-markdown2.hash b/package/python-markdown2/python-markdown2.hash
index 59a9a13ad1..2d72a78053 100644
--- a/package/python-markdown2/python-markdown2.hash
+++ b/package/python-markdown2/python-markdown2.hash
@@ -1,3 +1,5 @@
-# Locally computed
-sha256	53a6100ee005df09d0462cc246f8dc7cd48f4678d1074f36e7cff980a3819b48  python-markdown2-2.3.6.tar.gz
+# md5, sha256 from https://pypi.org/pypi/markdown2/json
+md5	a8dee88993d05a3e10765a57b1e1ea07  markdown2-2.3.8.tar.gz
+sha256	7ff88e00b396c02c8e1ecd8d176cfa418fb01fe81234dcea77803e7ce4f05dbe  markdown2-2.3.8.tar.gz
+# Locally computed sha256 checksums
 sha256	f8c7c4d554409cf621b8d653dbfffb719745fd36f5c49b8305258649b403ef9c  LICENSE.txt
diff --git a/package/python-markdown2/python-markdown2.mk b/package/python-markdown2/python-markdown2.mk
index 8069ef9185..d8b946e140 100644
--- a/package/python-markdown2/python-markdown2.mk
+++ b/package/python-markdown2/python-markdown2.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-PYTHON_MARKDOWN2_VERSION = 2.3.6
-PYTHON_MARKDOWN2_SITE = $(call github,trentm,python-markdown2,$(PYTHON_MARKDOWN2_VERSION))
-PYTHON_MARKDOWN2_SETUP_TYPE = distutils
+PYTHON_MARKDOWN2_VERSION = 2.3.8
+PYTHON_MARKDOWN2_SOURCE = markdown2-$(PYTHON_MARKDOWN2_VERSION).tar.gz
+PYTHON_MARKDOWN2_SITE = https://files.pythonhosted.org/packages/e3/93/d37055743009d1a492b2670cc215831a388b3d6e4a28b7672fdf0f7854f5
+PYTHON_MARKDOWN2_SETUP_TYPE = setuptools
 PYTHON_MARKDOWN2_LICENSE = MIT
 PYTHON_MARKDOWN2_LICENSE_FILES = LICENSE.txt
 
