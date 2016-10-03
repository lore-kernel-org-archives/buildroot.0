From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  3 Oct 2016 23:11:42 +0200
Subject: [Buildroot] [PATCH 22/28] package/python-prompt-toolkit: bump
	version to 1.0.7
In-Reply-To: <20161003211148.18603-1-bernd.kuhls@t-online.de>
References: <20161003211148.18603-1-bernd.kuhls@t-online.de>
Message-ID: <20161003211148.18603-22-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python-prompt-toolkit/python-prompt-toolkit.hash | 6 +++---
 package/python-prompt-toolkit/python-prompt-toolkit.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-prompt-toolkit/python-prompt-toolkit.hash b/package/python-prompt-toolkit/python-prompt-toolkit.hash
index f33e99a..0211a96 100644
--- a/package/python-prompt-toolkit/python-prompt-toolkit.hash
+++ b/package/python-prompt-toolkit/python-prompt-toolkit.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi/prompt_toolkit/json, sha256 locally computed
-md5	6c4133d099603f496c761491043bf0ef  prompt_toolkit-1.0.3.tar.gz
-sha256	805e026f0cbad27467e93f9dd3e3777718d401a62788c1e84ca038e967ad8ba2  prompt_toolkit-1.0.3.tar.gz
+# md5 from https://pypi.python.org/pypi/prompt-toolkit/json, sha256 locally computed
+md5	f74cd8ac84176fac1cdb136843ccb0d6  prompt_toolkit-1.0.7.tar.gz
+sha256	ef0b8188179fe7d052161ed274b43e18f5a680ff84d01462293b327e1668d2ef  prompt_toolkit-1.0.7.tar.gz
diff --git a/package/python-prompt-toolkit/python-prompt-toolkit.mk b/package/python-prompt-toolkit/python-prompt-toolkit.mk
index 634f20e..7e85dcd 100644
--- a/package/python-prompt-toolkit/python-prompt-toolkit.mk
+++ b/package/python-prompt-toolkit/python-prompt-toolkit.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PROMPT_TOOLKIT_VERSION = 1.0.3
+PYTHON_PROMPT_TOOLKIT_VERSION = 1.0.7
 PYTHON_PROMPT_TOOLKIT_SOURCE = prompt_toolkit-$(PYTHON_PROMPT_TOOLKIT_VERSION).tar.gz
-PYTHON_PROMPT_TOOLKIT_SITE = https://pypi.python.org/packages/8d/de/412f23919929c01e6b55183e124623f705e4b91796d3d2dce2cb53d595ad
+PYTHON_PROMPT_TOOLKIT_SITE = https://pypi.python.org/packages/dd/55/2fb4883d2b21d072204fd21ca5e6040faa253135554590d0b67380669176
 PYTHON_PROMPT_TOOLKIT_SETUP_TYPE = setuptools
 PYTHON_PROMPT_TOOLKIT_LICENSE = BSD-3c
 PYTHON_PROMPT_TOOLKIT_LICENSE_FILES = LICENSE
-- 
2.9.3
