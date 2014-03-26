From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Mar 2014 00:16:59 +0100
Subject: [Buildroot] [git commit] python3: drop PYTHON3_VERSION_MINOR
	variable
Message-ID: <20140326232029.2063D9C3AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6b925f1e54474cf9fcf939eb4cdd11f8d89a186c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python3/python3.mk |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index ce75e46..0144d1e 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,10 +5,9 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.4
-PYTHON3_VERSION_MINOR = 0
-PYTHON3_VERSION       = $(PYTHON3_VERSION_MAJOR).$(PYTHON3_VERSION_MINOR)
-PYTHON3_SOURCE        = Python-$(PYTHON3_VERSION).tar.xz
-PYTHON3_SITE          = http://python.org/ftp/python/$(PYTHON3_VERSION_MAJOR).$(PYTHON3_VERSION_MINOR)
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).0
+PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
+PYTHON3_SITE = http://python.org/ftp/python/$(PYTHON3_VERSION)
 
 # Python needs itself and a "pgen" program to build itself, both being
 # provided in the Python sources. So in order to cross-compile Python,
