From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Dec 2014 21:23:02 +0100
Subject: [Buildroot] [git commit] fconfig: change upstream site
Message-ID: <20141207202324.51B9F800F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6c2866724658af43c43db7ed15da8d47d40f745a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The upstream site is dead, used http://sources.buildroot.net
temporarly.

Fixes:

  http://autobuild.buildroot.org/results/778/77899f882e04121ca5f2b96f0df9f24ead26d12b/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/fconfig/fconfig.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/fconfig/fconfig.mk b/package/fconfig/fconfig.mk
index 3a846f4..7f7faad 100644
--- a/package/fconfig/fconfig.mk
+++ b/package/fconfig/fconfig.mk
@@ -5,7 +5,9 @@
 ################################################################################
 
 FCONFIG_VERSION = 20080329
-FCONFIG_SITE = http://andrzejekiert.ovh.org/software/fconfig
+# Real upstream location has been disabled
+# FCONFIG_SITE = http://andrzejekiert.ovh.org/software/fconfig
+FCONFIG_SITE = http://sources.buildroot.net
 FCONFIG_LICENSE = GPLv2+
 FCONFIG_LICENSE_FILES = fconfig.c
 
