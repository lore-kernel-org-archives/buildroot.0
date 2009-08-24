From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Aug 2009 22:28:47 +0200
Subject: [Buildroot] [git commit master] libsoup: enable autoreconf
Message-ID: <20090824202958.395E37774C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=843c592a7c89dd564e17158871fa792aec1a5e97
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To get the libtool patch to make some effect, an autoreconfiguration
is necessary.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsoup/libsoup.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index c0b85e2..b4eaa5a 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -8,7 +8,7 @@ LIBSOUP_MAJOR_VERSION:=2.26
 LIBSOUP_VERSION:=$(LIBSOUP_MAJOR_VERSION).2
 LIBSOUP_SOURCE:=libsoup-$(LIBSOUP_VERSION).tar.bz2
 LIBSOUP_SITE:=http://ftp.gnome.org/pub/gnome/sources/libsoup/$(LIBSOUP_MAJOR_VERSION)
-LIBSOUP_AUTORECONF = NO
+LIBSOUP_AUTORECONF = YES
 LIBSOUP_INSTALL_STAGING = YES
 LIBSOUP_INSTALL_TARGET = YES
 
-- 
1.6.3.3
