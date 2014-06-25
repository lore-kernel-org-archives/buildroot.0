From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Jun 2014 23:09:51 +0200
Subject: [Buildroot] [git commit] openocd: add license information
Message-ID: <20140625211214.3B4589D0C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f4f56991998b946595c785b187786d335994f5f7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openocd/openocd.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index ac3cd77..24ac0ca 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -7,6 +7,8 @@
 OPENOCD_VERSION = 0.5.0
 OPENOCD_SOURCE = openocd-$(OPENOCD_VERSION).tar.bz2
 OPENOCD_SITE = http://downloads.sourceforge.net/project/openocd/openocd/$(OPENOCD_VERSION)
+OPENOCD_LICENSE = GPLv2+
+OPENOCD_LICENSE_FILES = COPYING
 
 OPENOCD_AUTORECONF = YES
 OPENOCD_CONF_OPT = \
