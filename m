From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jun 2014 16:21:20 -0300
Subject: [Buildroot] [PATCH 52/53] xterm: add license information
In-Reply-To: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403810481-10025-52-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/xterm/xterm.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
index ceb5d76..3269d8c 100644
--- a/package/xterm/xterm.mk
+++ b/package/xterm/xterm.mk
@@ -9,5 +9,7 @@ XTERM_SOURCE = xterm-$(XTERM_VERSION).tgz
 XTERM_SITE = ftp://invisible-island.net/xterm
 XTERM_DEPENDENCIES = ncurses xlib_libXaw
 XTERM_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
+XTERM_LICENSE = MIT
+XTERM_LICENSE_FILES = version.c
 
 $(eval $(autotools-package))
-- 
1.8.5.5
