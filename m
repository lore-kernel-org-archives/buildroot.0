From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Oct 2015 15:50:12 +0200
Subject: [Buildroot] [git commit] vtun: add license info
Message-ID: <20151002135307.922A181E05@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7dbf2d6ea1afeb16ee822fdd10b417d620450092
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vtun/vtun.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/vtun/vtun.mk b/package/vtun/vtun.mk
index 2a3f548..5e0e266 100644
--- a/package/vtun/vtun.mk
+++ b/package/vtun/vtun.mk
@@ -6,6 +6,8 @@
 
 VTUN_VERSION = 3.0.3
 VTUN_SITE = http://downloads.sourceforge.net/project/vtun/vtun/$(VTUN_VERSION)
+VTUN_LICENSE = GPLv2+ with OpenSSL exception
+VTUN_LICENSE_FILES = README.OpenSSL
 VTUN_DEPENDENCIES = host-bison host-flex zlib lzo openssl
 VTUN_AUTORECONF = YES
 
