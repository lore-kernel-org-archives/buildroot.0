From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 22 May 2017 11:12:02 +0200
Subject: [Buildroot] [git commit] package/python-enum34: change setup type
	to setuptools
Message-ID: <20170522092418.78F03827E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3c54b7086fc0eaddb7f04560f30bb8cc99860b25
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With version 1.1.3 the project switched to setuptools:
https://bitbucket.org/stoneleaf/enum34/commits/589b4f9d2e733a32c6e67a1e7aa50f476920d121

Fixes
http://autobuild.buildroot.net/results/cb6/cb678ca9e57382a876f3f6034a47a4e2c59bc8d0/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-enum34/python-enum34.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-enum34/python-enum34.mk b/package/python-enum34/python-enum34.mk
index 1a4c6c6..c612cb6 100644
--- a/package/python-enum34/python-enum34.mk
+++ b/package/python-enum34/python-enum34.mk
@@ -7,7 +7,7 @@
 PYTHON_ENUM34_VERSION = 1.1.6
 PYTHON_ENUM34_SOURCE = enum34-$(PYTHON_ENUM34_VERSION).tar.gz
 PYTHON_ENUM34_SITE = https://pypi.python.org/packages/bf/3e/31d502c25302814a7c2f1d3959d2a3b3f78e509002ba91aea64993936876
-PYTHON_ENUM34_SETUP_TYPE = distutils
+PYTHON_ENUM34_SETUP_TYPE = setuptools
 PYTHON_ENUM34_LICENSE = BSD-3-Clause
 PYTHON_ENUM34_LICENSE_FILES = enum/LICENSE
 
