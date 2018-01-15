From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Jan 2018 16:38:01 +0100
Subject: [Buildroot] [git commit] python-xlib: fix check-package warning
Message-ID: <20180115153858.5A46883D24@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=34fb29f4fc7fd15a0377f2042d3468fa3cdd56b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-xlib/python-xlib.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-xlib/python-xlib.mk b/package/python-xlib/python-xlib.mk
index 93de424..0ce6e43 100644
--- a/package/python-xlib/python-xlib.mk
+++ b/package/python-xlib/python-xlib.mk
@@ -1,8 +1,8 @@
-###############################################################################
+################################################################################
 #
 # python-xlib
 #
-###############################################################################
+################################################################################
 
 PYTHON_XLIB_VERSION = 0.21
 PYTHON_XLIB_SOURCE = python-xlib-$(PYTHON_XLIB_VERSION).tar.bz2
