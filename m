From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Mar 2015 22:12:18 +0100
Subject: [Buildroot] [git commit] python-netifaces: fix license file name
Message-ID: <20150311213915.85AD47FFD0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=139b427d70920dc838f77c1398e2a4944c61ba9b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License info is stored in README.rst, not README.

[Peter: reword]
Signed-off-by: David Graziano <david.graziano@rockwellcollins.com>
Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-netifaces/python-netifaces.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/python-netifaces/python-netifaces.mk b/package/python-netifaces/python-netifaces.mk
index f748bc1..2c51ce0 100644
--- a/package/python-netifaces/python-netifaces.mk
+++ b/package/python-netifaces/python-netifaces.mk
@@ -8,7 +8,7 @@ PYTHON_NETIFACES_VERSION = 0.10.4
 PYTHON_NETIFACES_SOURCE = netifaces-$(PYTHON_NETIFACES_VERSION).tar.gz
 PYTHON_NETIFACES_SITE = https://pypi.python.org/packages/source/n/netifaces
 PYTHON_NETIFACES_LICENSE = MIT
-PYTHON_NETIFACES_LICENSE_FILES = README
+PYTHON_NETIFACES_LICENSE_FILES = README.rst
 PYTHON_NETIFACES_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
