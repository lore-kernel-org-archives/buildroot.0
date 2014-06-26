From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Jun 2014 23:03:13 +0200
Subject: [Buildroot] [git commit] avrdude: add license information
Message-ID: <20140627070642.469F79D0F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d1f545004bf0533064363d87c2d7c71e7acf7435
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/avrdude/avrdude.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
index b45baaf..7876c1d 100644
--- a/package/avrdude/avrdude.mk
+++ b/package/avrdude/avrdude.mk
@@ -14,6 +14,8 @@ AVRDUDE_SUBDIR = avrdude
 AVRDUDE_AUTORECONF = YES
 AVRDUDE_DEPENDENCIES = libelf libusb libusb-compat ncurses \
 	host-flex host-bison
+AVRDUDE_LICENSE = GPLv2+
+AVRDUDE_LICENSE_FILES = avrdude/COPYING
 
 ifeq ($(BR2_PACKAGE_LIBFTDI),y)
 AVRDUDE_DEPENDENCIES += libftdi
