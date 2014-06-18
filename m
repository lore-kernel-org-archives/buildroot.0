From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Jun 2014 13:56:11 +0200
Subject: [Buildroot] [git commit] pax-utils: bump to version 0.8.1
Message-ID: <20140618123419.95B329CB10@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f0b95e6ab8409cfb2bcfe521517705b14f8ef174
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pax-utils/pax-utils.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pax-utils/pax-utils.mk b/package/pax-utils/pax-utils.mk
index 6dbb3bb..fc0589f 100644
--- a/package/pax-utils/pax-utils.mk
+++ b/package/pax-utils/pax-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PAX_UTILS_VERSION = 0.7
+PAX_UTILS_VERSION = 0.8.1
 PAX_UTILS_SITE = http://distfiles.gentoo.org/distfiles
 PAX_UTILS_SOURCE = pax-utils-$(PAX_UTILS_VERSION).tar.xz
 PAX_UTILS_LICENSE = GPLv2
