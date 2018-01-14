From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Sun, 14 Jan 2018 13:16:57 -0800
Subject: [Buildroot] [PATCH 1/1] python-xlib: fix check-package warning
In-Reply-To: <20180113221034.GH3226@scaer>
References: <20180113221034.GH3226@scaer>
Message-ID: <20180114211657.5160-1-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 package/python-xlib/python-xlib.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-xlib/python-xlib.mk b/package/python-xlib/python-xlib.mk
index 93de424a3e..0ce6e43422 100644
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
-- 
2.15.1
