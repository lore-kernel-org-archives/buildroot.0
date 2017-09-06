From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Sep 2017 22:31:04 +0200
Subject: [Buildroot] [git commit] xavante: add LICENSE_FILES
Message-ID: <20170906203034.BC9838071A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4dd0919a473c3aa2ae10cfb5a74d8e81ce34f15e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xavante/xavante.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/xavante/xavante.mk b/package/xavante/xavante.mk
index 20e4aab..d962e7b 100644
--- a/package/xavante/xavante.mk
+++ b/package/xavante/xavante.mk
@@ -6,5 +6,6 @@
 
 XAVANTE_VERSION = 2.4.0-1
 XAVANTE_LICENSE = MIT
+XAVANTE_LICENSE_FILES = $(XAVANTE_SUBDIR)/doc/us/license.html
 
 $(eval $(luarocks-package))
