From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Jul 2014 00:39:00 +0200
Subject: [Buildroot] [git commit] thttpd: add license information
Message-ID: <20140701224922.7647D9D12D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=05d42db84bdc3f32ab0ceefa564f0a79e964c712
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/thttpd/thttpd.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/thttpd/thttpd.mk b/package/thttpd/thttpd.mk
index f4797fa..7be264a 100644
--- a/package/thttpd/thttpd.mk
+++ b/package/thttpd/thttpd.mk
@@ -8,6 +8,8 @@ THTTPD_VERSION = 2.25b
 THTTPD_SOURCE = thttpd_$(THTTPD_VERSION).orig.tar.gz
 THTTPD_PATCH = thttpd_$(THTTPD_VERSION)-11.diff.gz
 THTTPD_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/t/thttpd/
+THTTPD_LICENSE = BSD-2c
+THTTPD_LICENSE_FILES = thttpd.c
 
 ifneq ($(THTTPD_PATCH),)
 define THTTPD_DEBIAN_PATCHES
