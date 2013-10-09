From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Oct 2013 21:38:01 +0200
Subject: [Buildroot] [git commit] libnetfilter_queue: correct license GPLv2
	-> GPLv2+
Message-ID: <20131009194411.875DA9B99C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=39e3455848cb79872bd5894fe335c9c94f523ef5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnetfilter_queue/libnetfilter-queue.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libnetfilter_queue/libnetfilter-queue.mk b/package/libnetfilter_queue/libnetfilter-queue.mk
index 66b102f..59a4458 100644
--- a/package/libnetfilter_queue/libnetfilter-queue.mk
+++ b/package/libnetfilter_queue/libnetfilter-queue.mk
@@ -10,7 +10,7 @@ LIBNETFILTER_QUEUE_SITE = http://www.netfilter.org/projects/libnetfilter_queue/f
 LIBNETFILTER_QUEUE_INSTALL_STAGING = YES
 LIBNETFILTER_QUEUE_DEPENDENCIES = host-pkgconf libnfnetlink libmnl
 LIBNETFILTER_QUEUE_AUTORECONF = YES
-LIBNETFILTER_QUEUE_LICENSE = GPLv2
+LIBNETFILTER_QUEUE_LICENSE = GPLv2+
 LIBNETFILTER_QUEUE_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
