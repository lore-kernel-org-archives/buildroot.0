From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 01 Dec 2011 08:58:35 -0000
Subject: [Buildroot] [git commit] nano: bump to version 2.3.1
Message-ID: <20111201085834.0909B8F75B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=14520a6866e89d504947443bcf5633ffb34d3a92
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
