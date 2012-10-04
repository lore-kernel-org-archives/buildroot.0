From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 4 Oct 2012 22:30:51 +0200
Subject: [Buildroot] [git commit] strace: Version bump to 4.7
Message-ID: <20121004205124.463F4997BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3732b05b1dcdf79392b86ba1922b0d0f2ee8cced
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This also fixes a compilation problem with kernel headers 3.5
http://autobuild.buildroot.net/results/bb66a3a06d26f558e1c4c0593bb68e7af1d82398/build-end.log

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/strace/strace.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 2d95137..5c2d33c 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,8 +4,8 @@
 #
 #############################################################
 
-STRACE_VERSION = 4.5.20
-STRACE_SOURCE = strace-$(STRACE_VERSION).tar.bz2
+STRACE_VERSION = 4.7
+STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = http://downloads.sourceforge.net/project/strace/strace/$(STRACE_VERSION)
 
 STRACE_CONF_ENV = ac_cv_header_linux_if_packet_h=yes \
