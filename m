From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Jan 2014 15:01:54 +0100
Subject: [Buildroot] [git commit] lrzsz: add license info and fix typo
Message-ID: <20140102140202.5C8FA9C361@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5cb4cd8ef39eb1b7879c1750da5fc1d8ec587012
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lrzsz/lrzsz.mk |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/lrzsz/lrzsz.mk b/package/lrzsz/lrzsz.mk
index f90d528..4b8a12a 100644
--- a/package/lrzsz/lrzsz.mk
+++ b/package/lrzsz/lrzsz.mk
@@ -6,8 +6,9 @@
 
 LRZSZ_VERSION = 0.12.20
 LRZSZ_SITE = http://www.ohse.de/uwe/releases
-
-LRZSR_CONF_OPT = --disable-timesync
+LRZSZ_CONF_OPT = --disable-timesync
+LRZSZ_LICENSE = GPLv2+
+LRZSZ_LICENSE_FILES = COPYING
 
 define LRZSZ_POST_CONFIGURE_HOOKS
 	$(SED) "s/-lnsl//;" $(@D)/src/Makefile
