From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Aug 2020 16:46:56 +0200
Subject: [Buildroot] [git commit branch/next] package/python3-pyelftools:
 use PYTHON3_PYELFTOOLS_VERSION
Message-ID: <20200812144330.5D73A85F4A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d7e6a935c0ceee63b50b891cb1a01fa34e88e663
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
