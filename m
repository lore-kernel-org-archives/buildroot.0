From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 10 Jun 2013 23:07:42 +0200
Subject: [Buildroot] [git commit] strace: fix legal info
Message-ID: <20130610211339.5F4139A5B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=205f06c615d70a877ab3c96dd2f1b5bdb01f678f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The license file changed from COPYRIGHT->COPYING. Fixes:
http://autobuild.buildroot.net/results/b61/b61e1775cd1eec83470424e88ced5bd49e0cd469/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/strace/strace.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 0dce096..9addbb6 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -8,7 +8,7 @@ STRACE_VERSION = 4.8
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = http://downloads.sourceforge.net/project/strace/strace/$(STRACE_VERSION)
 STRACE_LICENSE = BSD-3c
-STRACE_LICENSE_FILES = COPYRIGHT
+STRACE_LICENSE_FILES = COPYING
 
 STRACE_CONF_ENV = ac_cv_header_linux_if_packet_h=yes \
 		  ac_cv_header_linux_netlink_h=yes
