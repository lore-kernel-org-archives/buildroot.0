From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 14 Nov 2012 22:34:13 +0100
Subject: [Buildroot] [git commit] libtool: add license info
Message-ID: <20121114214728.4EC0099B26@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=019144c859385505a5351871839fea00a7339bf6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libtool/libtool.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libtool/libtool.mk b/package/libtool/libtool.mk
index 4b9657c..0934ffe 100644
--- a/package/libtool/libtool.mk
+++ b/package/libtool/libtool.mk
@@ -7,6 +7,8 @@ LIBTOOL_VERSION = 2.2.10
 LIBTOOL_SOURCE = libtool-$(LIBTOOL_VERSION).tar.gz
 LIBTOOL_SITE = $(BR2_GNU_MIRROR)/libtool
 LIBTOOL_INSTALL_STAGING = YES
+LIBTOOL_LICENSE = GPLv2+
+LIBTOOL_LICENSE_FILES = COPYING
 
 HOST_LIBTOOL_LIBTOOL_PATCH = NO
 
