From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 15 Apr 2013 23:57:16 +0200
Subject: [Buildroot] [git commit] madplay: add license information
Message-ID: <20130415215908.18E149B6DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eed1d7f00cdd2b91b3ccdc1a8f911638d2147e4a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/madplay/madplay.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/madplay/madplay.mk b/package/multimedia/madplay/madplay.mk
index e80726c..d68c86b 100644
--- a/package/multimedia/madplay/madplay.mk
+++ b/package/multimedia/madplay/madplay.mk
@@ -7,6 +7,8 @@
 MADPLAY_VERSION = 0.15.2b
 MADPLAY_SOURCE = madplay-$(MADPLAY_VERSION).tar.gz
 MADPLAY_SITE = http://downloads.sourceforge.net/project/mad/madplay/$(MADPLAY_VERSION)
+MADPLAY_LICENSE = GPLv2+
+MADPLAY_LICENSE_FILES = COPYING COPYRIGHT
 MADPLAY_LIBTOOL_PATCH = NO
 MADPLAY_DEPENDENCIES = libmad libid3tag
 
