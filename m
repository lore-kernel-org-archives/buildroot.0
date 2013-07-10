From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 10 Jul 2013 22:08:15 +0200
Subject: [Buildroot] [git commit] libtheora: define license
Message-ID: <20130710202005.E5AB49A196@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=abd4201ff02db2f09e29e4dd3b9f4317089592a9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libtheora/libtheora.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libtheora/libtheora.mk b/package/libtheora/libtheora.mk
index d31dac3..4ba342b 100644
--- a/package/libtheora/libtheora.mk
+++ b/package/libtheora/libtheora.mk
@@ -8,6 +8,8 @@ LIBTHEORA_VERSION = 1.1.1
 LIBTHEORA_SOURCE = libtheora-$(LIBTHEORA_VERSION).tar.bz2
 LIBTHEORA_SITE = http://downloads.xiph.org/releases/theora
 LIBTHEORA_INSTALL_STAGING = YES
+LIBTHEORA_LICENSE = BSD-3c
+LIBTHEORA_LICENSE_FILES = COPYING LICENSE
 
 LIBTHEORA_CONF_OPT = \
 		--disable-oggtest \
