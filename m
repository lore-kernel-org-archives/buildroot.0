From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 6 Oct 2010 13:38:46 +0200
Subject: [Buildroot] [git commit master 1/1] nano: bump to 2.2.5
Message-ID: <20101006113858.055938BE58@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=475de409fd6ea4d55321edfcac8b142b7abb95d6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/nano/nano.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 47355a3..5e9824b 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-NANO_VERSION = 2.2.3
+NANO_VERSION = 2.2.5
 NANO_SITE = http://www.nano-editor.org/dist/v2.2
 NANO_MAKE_ENV = CURSES_LIB="-lncurses"
 NANO_CONF_OPT = --without-slang --enable-tiny
-- 
1.7.1
