From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Sep 2017 22:20:30 +0200
Subject: [Buildroot] [git commit] cgilua: add LICENSE_FILES
Message-ID: <20170906203033.30ADC8215C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=448475231c98f0a5fb325266507ad626d5858c45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cgilua/cgilua.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cgilua/cgilua.mk b/package/cgilua/cgilua.mk
index 73006ff..cd78841 100644
--- a/package/cgilua/cgilua.mk
+++ b/package/cgilua/cgilua.mk
@@ -6,5 +6,6 @@
 
 CGILUA_VERSION = 5.2.1-1
 CGILUA_LICENSE = MIT
+CGILUA_LICENSE_FILES = $(CGILUA_SUBDIR)/doc/us/license.html
 
 $(eval $(luarocks-package))
