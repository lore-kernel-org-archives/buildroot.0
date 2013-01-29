From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 29 Jan 2013 23:29:21 +0100
Subject: [Buildroot] [git commit] kismet: add license information
Message-ID: <20130129223113.5B0519A88F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3edc40ec84ab3aef5d27a818de5b12f431aa9235
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/kismet/kismet.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index c8ae8e3..3787f07 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -7,6 +7,8 @@
 KISMET_VERSION = 2011-03-R2
 KISMET_SITE = http://www.kismetwireless.net/code
 KISMET_DEPENDENCIES = libpcap ncurses
+KISMET_LICENSE = GPLv2+
+KISMET_LICENSE_FILES = GPL
 
 ifeq ($(BR2_PACKAGE_LIBNL),y)
 	KISMET_DEPENDENCIES += libnl
