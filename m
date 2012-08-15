From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Aug 2012 12:03:53 +0200
Subject: [Buildroot] [git commit] socat: add license info
Message-ID: <20120815100418.AD03C971BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b27921a809a395ee21ba88c7e87de2133ffc0ac6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/socat/socat.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index 9a5234d..f10a836 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -7,6 +7,8 @@
 SOCAT_VERSION = 2.0.0-b5
 SOCAT_SOURCE = socat-$(SOCAT_VERSION).tar.bz2
 SOCAT_SITE = http://www.dest-unreach.org/socat/download/
+SOCAT_LICENSE = GPLv2
+SOCAT_LICENSE_FILES = COPYING
 SOCAT_CONF_ENV = sc_cv_termios_ispeed=no \
 		 sc_cv_sys_crdly_shift=9 \
 		 sc_cv_sys_tabdly_shift=11 \
