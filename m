From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Dec 2014 19:53:52 +0100
Subject: [Buildroot] [git commit] kismet: bump version to Kismet-2014-02-R1
Message-ID: <20141211190139.26F438002D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fa3d2a11e939dc74431fa22edd9ab04e65a79244
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kismet/kismet.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index 5cb5648..f177fea 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-KISMET_VERSION = 2013-03-R1b
-KISMET_SOURCE = kismet-$(KISMET_VERSION).tar.xz
-KISMET_SITE = http://www.kismetwireless.net/code
+KISMET_VERSION = Kismet-2014-02-R1
+KISMET_SITE = http://www.kismetwireless.net/kismet.git
+KISMET_SITE_METHOD = git
 KISMET_DEPENDENCIES = host-pkgconf libpcap ncurses libnl
 KISMET_CONF_OPTS += --with-netlink-version=3
 KISMET_LICENSE = GPLv2+
