From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 6 May 2013 13:57:45 +0200
Subject: [Buildroot] [git commit] make: add license info
Message-ID: <20130506115817.D8D3A99C41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9ae2f2c2853e8268254a816789c3888173617965
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/make/make.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/make/make.mk b/package/make/make.mk
index 25bc5fa..a24a28e 100644
--- a/package/make/make.mk
+++ b/package/make/make.mk
@@ -7,6 +7,8 @@
 MAKE_VERSION = 3.82
 MAKE_SOURCE = make-$(MAKE_VERSION).tar.bz2
 MAKE_SITE = $(BR2_GNU_MIRROR)/make
+MAKE_LICENSE = GPLv3+
+MAKE_LICENSE_FILES = COPYING
 
 MAKE_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 
