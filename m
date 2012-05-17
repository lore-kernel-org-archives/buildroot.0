From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 17 May 2012 19:33:12 +0200
Subject: [Buildroot] [PATCH v4 13/22] fakeroot: define license
In-Reply-To: <1337276001-26149-1-git-send-email-luca@lucaceresoli.net>
References: <1337276001-26149-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1337276001-26149-14-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/fakeroot/fakeroot.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
index 64203b8..a9074cb 100644
--- a/package/fakeroot/fakeroot.mk
+++ b/package/fakeroot/fakeroot.mk
@@ -6,5 +6,7 @@
 FAKEROOT_VERSION = 1.18.2
 FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.bz2
 FAKEROOT_SITE = http://snapshot.debian.org/archive/debian/20111201T093630Z/pool/main/f/fakeroot/
+FAKEROOT_LICENSE = GPLv3+
+FAKEROOT_LICENSE_FILES = COPYING
 
 $(eval $(call AUTOTARGETS,host))
-- 
1.7.9.5
