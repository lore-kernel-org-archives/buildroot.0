From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 14 Nov 2012 22:37:29 +0100
Subject: [Buildroot] [git commit] strace: add license info
Message-ID: <20121114214735.1187E99B26@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=edaf2eaade5970eefe64903779debfa445ae0606
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/strace/strace.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index ad1d042..349dc2c 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -7,6 +7,8 @@
 STRACE_VERSION = 4.7
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = http://downloads.sourceforge.net/project/strace/strace/$(STRACE_VERSION)
+STRACE_LICENSE = BSD-3c
+STRACE_LICENSE_FILES = COPYRIGHT
 
 STRACE_CONF_ENV = ac_cv_header_linux_if_packet_h=yes \
 		  ac_cv_header_linux_netlink_h=yes
