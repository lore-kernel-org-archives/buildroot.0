From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Feb 2015 22:11:55 +0100
Subject: [Buildroot] [git commit] python-werkzeug: bump to 0.10
Message-ID: <20150203211838.8DB1C8082B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=537b3c0ca95ea2dc9d8176e6bcd4a06e2e122c2b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-werkzeug/python-werkzeug.hash |    4 ++--
 package/python-werkzeug/python-werkzeug.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-werkzeug/python-werkzeug.hash b/package/python-werkzeug/python-werkzeug.hash
index 38f622a..3dcc5b4 100644
--- a/package/python-werkzeug/python-werkzeug.hash
+++ b/package/python-werkzeug/python-werkzeug.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi?:action=show_md5&digest=f7afcadc03b0f2267bdc156c34586043, sha256 locally computed
-md5	f7afcadc03b0f2267bdc156c34586043  Werkzeug-0.9.6.tar.gz
-sha256	7f11e7e2e73eb22677cac1b11113eb6106f66cedef13d140e83cf6563c90b79c  Werkzeug-0.9.6.tar.gz
+md5	42ebf43b19475bf856fde740050d7707  Werkzeug-0.10.tar.gz
+sha256	9a97a6fcf87390172748da9e5250710b352dff18e979db925d276112cdcfa7ac  Werkzeug-0.10.tar.gz
diff --git a/package/python-werkzeug/python-werkzeug.mk b/package/python-werkzeug/python-werkzeug.mk
index 8902d17..41ae430 100644
--- a/package/python-werkzeug/python-werkzeug.mk
+++ b/package/python-werkzeug/python-werkzeug.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_WERKZEUG_VERSION = 0.9.6
+PYTHON_WERKZEUG_VERSION = 0.10
 PYTHON_WERKZEUG_SOURCE = Werkzeug-$(PYTHON_WERKZEUG_VERSION).tar.gz
 PYTHON_WERKZEUG_SITE = http://pypi.python.org/packages/source/W/Werkzeug
 PYTHON_WERKZEUG_SETUP_TYPE = setuptools
