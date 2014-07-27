From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Jul 2014 14:36:05 +0200
Subject: [Buildroot] [git commit] python3: define license and license files
Message-ID: <20140727123734.DD7249D08E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d8ba42df87b08b661ba906b8ab906fef65491509
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python3/python3.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 3aa22b2..4941316 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -8,6 +8,8 @@ PYTHON3_VERSION_MAJOR = 3.4
 PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).1
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = http://python.org/ftp/python/$(PYTHON3_VERSION)
+PYTHON3_LICENSE = Python software foundation license v2, others
+PYTHON3_LICENSE_FILES = LICENSE
 
 # Python needs itself and a "pgen" program to build itself, both being
 # provided in the Python sources. So in order to cross-compile Python,
