From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 May 2014 13:41:18 +0200
Subject: [Buildroot] [git commit] python-serial: add license information
Message-ID: <20140507120710.C569F9CA29@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=05b95a148a8928a83a88d4e6f4071fdc088281b2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-serial/python-serial.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/python-serial/python-serial.mk b/package/python-serial/python-serial.mk
index a44d799..d35a9f0 100644
--- a/package/python-serial/python-serial.mk
+++ b/package/python-serial/python-serial.mk
@@ -7,6 +7,8 @@
 PYTHON_SERIAL_VERSION = 2.6
 PYTHON_SERIAL_SOURCE  = pyserial-$(PYTHON_SERIAL_VERSION).tar.gz
 PYTHON_SERIAL_SITE    = http://pypi.python.org/packages/source/p/pyserial
+PYTHON_SERIAL_LICENSE = Python Software Foundation License
+PYTHON_SERIAL_LICENSE_FILES = LICENSE.txt
 PYTHON_SERIAL_SETUP_TYPE = distutils
 
 $(eval $(python-package))
