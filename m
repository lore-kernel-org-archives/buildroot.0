From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Aug 2014 19:51:27 +0200
Subject: [Buildroot] [git commit] manual: fix copy/paste error in python
	package example
Message-ID: <20140806175131.5D1C09D3C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dffb833cbc3dc76d91f00d81d00b3e153fb8267b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The SOURCE references "LIBFOO_VERSION", should be "PYTHON_FOO_VERSION".

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Acked-by: Thomas De Schampheleire < thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-python.txt |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/docs/manual/adding-packages-python.txt b/docs/manual/adding-packages-python.txt
index c4a13e0..46d140d 100644
--- a/docs/manual/adding-packages-python.txt
+++ b/docs/manual/adding-packages-python.txt
@@ -22,7 +22,7 @@ with an example :
 05: ################################################################################
 06:
 07: PYTHON_FOO_VERSION = 1.0
-08: PYTHON_FOO_SOURCE = python-foo-$(LIBFOO_VERSION).tar.xz
+08: PYTHON_FOO_SOURCE = python-foo-$(PYTHON_FOO_VERSION).tar.xz
 09: PYTHON_FOO_SITE = http://www.foosoftware.org/download
 10: PYTHON_FOO_LICENSE = BSD-3c
 11: PYTHON_FOO_LICENSE_FILES = LICENSE
