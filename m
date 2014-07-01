From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jul 2014 23:45:08 +0200
Subject: [Buildroot] [git commit] libmbus: add license information
Message-ID: <20140701224922.097F29D12D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b1db95b395cd6becb9320420fa5ca7e94096db42
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmbus/libmbus.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libmbus/libmbus.mk b/package/libmbus/libmbus.mk
index 93fe95f..6298543 100644
--- a/package/libmbus/libmbus.mk
+++ b/package/libmbus/libmbus.mk
@@ -7,5 +7,7 @@
 LIBMBUS_VERSION = 0.8.0
 LIBMBUS_SITE = http://www.rscada.se/public-dist/
 LIBMBUS_INSTALL_STAGING = YES
+LIBMBUS_LICENSE = BSD-3c
+LIBMBUS_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
