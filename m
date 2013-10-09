From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Oct 2013 21:41:34 +0200
Subject: [Buildroot] [git commit] libnetfilter_log: correct license GPLv2 ->
	GPLv2+
Message-ID: <20131009194411.8E0D79B99C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=49abb6ede5a5c3209330f44bec39e99f6e889144
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnetfilter_log/libnetfilter-log.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libnetfilter_log/libnetfilter-log.mk b/package/libnetfilter_log/libnetfilter-log.mk
index 8a2c513..1c642d2 100644
--- a/package/libnetfilter_log/libnetfilter-log.mk
+++ b/package/libnetfilter_log/libnetfilter-log.mk
@@ -10,7 +10,7 @@ LIBNETFILTER_LOG_SITE = http://www.netfilter.org/projects/libnetfilter_log/files
 LIBNETFILTER_LOG_INSTALL_STAGING = YES
 LIBNETFILTER_LOG_DEPENDENCIES = host-pkgconf libnfnetlink
 LIBNETFILTER_LOG_AUTORECONF = YES
-LIBNETFILTER_LOG_LICENSE = GPLv2
+LIBNETFILTER_LOG_LICENSE = GPLv2+
 LIBNETFILTER_LOG_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
