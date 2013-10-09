From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Oct 2013 22:27:27 +0200
Subject: [Buildroot] [git commit] libnfnetlink: add license information
Message-ID: <20131009202946.2FAF19B9A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d52a3c0b0cc419ad3a79b8be2f1c91efd45b2ca4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: license is GPLv2]
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnfnetlink/libnfnetlink.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libnfnetlink/libnfnetlink.mk b/package/libnfnetlink/libnfnetlink.mk
index de5a9d8..6f69a81 100644
--- a/package/libnfnetlink/libnfnetlink.mk
+++ b/package/libnfnetlink/libnfnetlink.mk
@@ -9,5 +9,7 @@ LIBNFNETLINK_SOURCE = libnfnetlink-$(LIBNFNETLINK_VERSION).tar.bz2
 LIBNFNETLINK_SITE = http://www.netfilter.org/projects/libnfnetlink/files
 LIBNFNETLINK_AUTORECONF = YES
 LIBNFNETLINK_INSTALL_STAGING = YES
+LIBNFNETLINK_LICENSE = GPLv2
+LIBNFNETLINK_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
