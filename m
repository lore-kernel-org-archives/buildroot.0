From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 13 Nov 2011 19:27:55 -0300
Subject: [Buildroot] [PATCH 07/10] nano: bump to version 2.3.1
In-Reply-To: <1321223278-14388-1-git-send-email-gustavo@zacarias.com.ar>
References: <1321223278-14388-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1321223278-14388-7-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/nano/nano.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index c4162c1..2bf7121 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -4,8 +4,8 @@
 #
 #############################################################
 
-NANO_VERSION = 2.2.6
-NANO_SITE = http://www.nano-editor.org/dist/v2.2
+NANO_VERSION = 2.3.1
+NANO_SITE = http://www.nano-editor.org/dist/v2.3
 NANO_MAKE_ENV = CURSES_LIB="-lncurses"
 NANO_CONF_OPT = --without-slang --enable-tiny
 NANO_DEPENDENCIES = ncurses
-- 
1.7.3.4
