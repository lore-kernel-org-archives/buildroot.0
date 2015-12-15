From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 22:06:41 +0100
Subject: [Buildroot] [git commit] lttng-libust: comma separate licenses
Message-ID: <20151215210845.5C48D80409@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d27015442f3990de78b11a8830cc479c4dce87a8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: put between parenthesis the description of what is covered by
each license.]

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lttng-libust/lttng-libust.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index cfd2367..4a65057 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -7,7 +7,7 @@
 LTTNG_LIBUST_SITE = http://lttng.org/files/lttng-ust
 LTTNG_LIBUST_VERSION = 2.7.1
 LTTNG_LIBUST_SOURCE = lttng-ust-$(LTTNG_LIBUST_VERSION).tar.bz2
-LTTNG_LIBUST_LICENSE = LGPLv2.1; MIT for system headers; GPLv2 for liblttng-ust-ctl/ustctl.c (used by lttng-sessiond)
+LTTNG_LIBUST_LICENSE = LGPLv2.1, MIT (system headers), GPLv2 (liblttng-ust-ctl/ustctl.c used by lttng-sessiond)
 LTTNG_LIBUST_LICENSE_FILES = COPYING
 
 LTTNG_LIBUST_INSTALL_STAGING = YES
