From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Sep 2017 22:27:41 +0200
Subject: [Buildroot] [git commit] dado: add LICENSE_FILES
Message-ID: <20170906203033.740E58215C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c7e40ece0a60a7d96be097c3e0f6922e16dbba78
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dado/dado.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dado/dado.mk b/package/dado/dado.mk
index acef047..e4375a3 100644
--- a/package/dado/dado.mk
+++ b/package/dado/dado.mk
@@ -6,5 +6,6 @@
 
 DADO_VERSION = 1.8.3-1
 DADO_LICENSE = MIT
+DADO_LICENSE_FILES = $(DADO_SUBDIR)/doc/license.html
 
 $(eval $(luarocks-package))
