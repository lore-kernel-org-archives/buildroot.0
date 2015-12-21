From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 21 Dec 2015 11:50:22 +0100
Subject: [Buildroot] [PATCH 2/4] python-werkzeug: bump to 0.11.3
In-Reply-To: <1450695024-24875-1-git-send-email-yegorslists@googlemail.com>
References: <1450695024-24875-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1450695024-24875-2-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-werkzeug/python-werkzeug.hash | 6 +++---
 package/python-werkzeug/python-werkzeug.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-werkzeug/python-werkzeug.hash b/package/python-werkzeug/python-werkzeug.hash
index 3dcc5b4..f833b89 100644
--- a/package/python-werkzeug/python-werkzeug.hash
+++ b/package/python-werkzeug/python-werkzeug.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=f7afcadc03b0f2267bdc156c34586043, sha256 locally computed
-md5	42ebf43b19475bf856fde740050d7707  Werkzeug-0.10.tar.gz
-sha256	9a97a6fcf87390172748da9e5250710b352dff18e979db925d276112cdcfa7ac  Werkzeug-0.10.tar.gz
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=9479bc7ea6a42c2d0d82929d3926df67, sha256 locally computed
+md5	9479bc7ea6a42c2d0d82929d3926df67  Werkzeug-0.11.3.tar.gz
+sha256	eb5f700a9bfc96420b055635af9002d3662e43d80c3ffd31f224c25bc0d5f462  Werkzeug-0.11.3.tar.gz
diff --git a/package/python-werkzeug/python-werkzeug.mk b/package/python-werkzeug/python-werkzeug.mk
index 41ae430..3df481a 100644
--- a/package/python-werkzeug/python-werkzeug.mk
+++ b/package/python-werkzeug/python-werkzeug.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_WERKZEUG_VERSION = 0.10
+PYTHON_WERKZEUG_VERSION = 0.11.3
 PYTHON_WERKZEUG_SOURCE = Werkzeug-$(PYTHON_WERKZEUG_VERSION).tar.gz
 PYTHON_WERKZEUG_SITE = http://pypi.python.org/packages/source/W/Werkzeug
 PYTHON_WERKZEUG_SETUP_TYPE = setuptools
-- 
2.1.4
