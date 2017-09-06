From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Sep 2017 22:30:54 +0200
Subject: [Buildroot] [git commit] rings: add LICENSE_FILES
Message-ID: <20170906203034.16CE78188A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad8d1e444cbbec276b33a1a67726b2a01c6e8516
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rings/rings.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rings/rings.mk b/package/rings/rings.mk
index 151546a..92001bb 100644
--- a/package/rings/rings.mk
+++ b/package/rings/rings.mk
@@ -8,5 +8,6 @@ RINGS_VERSION_MAJOR = 1.3.0
 RINGS_VERSION = $(RINGS_VERSION_MAJOR)-1
 RINGS_SUBDIR = rings-v_$(subst .,_,$(RINGS_VERSION_MAJOR))
 RINGS_LICENSE = MIT
+RINGS_LICENSE_FILES = $(RINGS_SUBDIR)/doc/us/license.html
 
 $(eval $(luarocks-package))
