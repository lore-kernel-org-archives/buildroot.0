From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 11 Aug 2020 22:42:31 +0200
Subject: [Buildroot] [git commit branch/next] package/python3-decorator: use
 PYTHON3_DECORATOR_VERSION
Message-ID: <20200812144329.DD82185F4A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b37cfcbf9f74b1eac5a1f958ad33ed7489ea530d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python3-decorator/python3-decorator.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python3-decorator/python3-decorator.mk b/package/python3-decorator/python3-decorator.mk
index d809bb5b9b..c14f10fbf4 100644
--- a/package/python3-decorator/python3-decorator.mk
+++ b/package/python3-decorator/python3-decorator.mk
@@ -7,7 +7,7 @@
 # Please keep in sync with package/python-decorator/python-decorator.mk
 PYTHON3_DECORATOR_VERSION = 4.4.1
 PYTHON3_DECORATOR_SITE = https://files.pythonhosted.org/packages/dc/c3/9d378af09f5737cfd524b844cd2fbb0d2263a35c11d712043daab290144d
-PYTHON3_DECORATOR_SOURCE = decorator-$(PYTHON_DECORATOR_VERSION).tar.gz
+PYTHON3_DECORATOR_SOURCE = decorator-$(PYTHON3_DECORATOR_VERSION).tar.gz
 PYTHON3_DECORATOR_LICENSE = BSD-2-Clause
 PYTHON3_DECORATOR_LICENSE_FILES = LICENSE.txt
 PYTHON3_DECORATOR_SETUP_TYPE = setuptools
