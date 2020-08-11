From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 12 Aug 2020 00:19:59 +0200
Subject: [Buildroot] [PATCH 2/2] package/python3-pyelftools: use
 PYTHON3_PYELFTOOLS_VERSION
In-Reply-To: <20200811221959.2344566-1-fontaine.fabrice@gmail.com>
References: <20200811221959.2344566-1-fontaine.fabrice@gmail.com>
Message-ID: <20200811221959.2344566-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python3-pyelftools/python3-pyelftools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python3-pyelftools/python3-pyelftools.mk b/package/python3-pyelftools/python3-pyelftools.mk
index ea79aef66d..be49ca2bcf 100644
--- a/package/python3-pyelftools/python3-pyelftools.mk
+++ b/package/python3-pyelftools/python3-pyelftools.mk
@@ -6,7 +6,7 @@
 
 # Please keep in sync with package/python-pyelftools/python-pyelftools.mk
 PYTHON3_PYELFTOOLS_VERSION = 0.25
-PYTHON3_PYELFTOOLS_SOURCE = pyelftools-$(PYTHON_PYELFTOOLS_VERSION).tar.gz
+PYTHON3_PYELFTOOLS_SOURCE = pyelftools-$(PYTHON3_PYELFTOOLS_VERSION).tar.gz
 PYTHON3_PYELFTOOLS_SITE = https://files.pythonhosted.org/packages/fa/9a/0674cb1725196568bdbca98304f2efb17368b57af1a4bb3fc772c026f474
 PYTHON3_PYELFTOOLS_LICENSE = Public domain
 PYTHON3_PYELFTOOLS_LICENSE_FILES = LICENSE
-- 
2.27.0
