From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Sep 2017 22:27:39 +0200
Subject: [Buildroot] [git commit] coxpcall: add LICENSE_FILES
Message-ID: <20170906203033.63BBD80559@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d859734973664ef21d0b28a3f57af6b4640b739f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/coxpcall/coxpcall.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/coxpcall/coxpcall.mk b/package/coxpcall/coxpcall.mk
index 84c19f4..3af81f2 100644
--- a/package/coxpcall/coxpcall.mk
+++ b/package/coxpcall/coxpcall.mk
@@ -7,5 +7,6 @@
 COXPCALL_VERSION = 1.16.0-1
 COXPCALL_SUBDIR = coxpcall
 COXPCALL_LICENSE = MIT
+COXPCALL_LICENSE_FILES = $(COXPCALL_SUBDIR)/doc/license.html
 
 $(eval $(luarocks-package))
