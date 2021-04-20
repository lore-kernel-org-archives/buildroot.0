From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 20 Apr 2021 23:22:29 +0200
Subject: [Buildroot] [git commit] package/libdaemon: add _CPE_ID_VENDOR
Message-ID: <20210420205903.2FB1084359@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4baccb9c5b830dea85ec94e74fee05c38005f679
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:libdaemon_project:libdaemon:* is a valid CPE identifier for this package:

 https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:libdaemon_project:libdaemon

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
[yann.morin.1998 at free.fr: move up, right after license]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libdaemon/libdaemon.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libdaemon/libdaemon.mk b/package/libdaemon/libdaemon.mk
index a8f75108bc..cdf0819e68 100644
--- a/package/libdaemon/libdaemon.mk
+++ b/package/libdaemon/libdaemon.mk
@@ -8,6 +8,8 @@ LIBDAEMON_VERSION = 0.14
 LIBDAEMON_SITE = http://0pointer.de/lennart/projects/libdaemon
 LIBDAEMON_LICENSE = LGPL-2.1+
 LIBDAEMON_LICENSE_FILES = LICENSE
+LIBDAEMON_CPE_ID_VENDOR = libdaemon_project
+
 LIBDAEMON_INSTALL_STAGING = YES
 LIBDAEMON_CONF_ENV = ac_cv_func_setpgrp_void=no
 LIBDAEMON_CONF_OPTS = --disable-lynx
