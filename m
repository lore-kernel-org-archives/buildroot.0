From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 22:02:57 +0100
Subject: [Buildroot] [git commit] minidlna: comma separate licenses
Message-ID: <20151215210844.5019380409@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=071d4f47bf5ba139455c69679427c2fdfd7adf37
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/minidlna/minidlna.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
index e00fa09..6902aa8 100644
--- a/package/minidlna/minidlna.mk
+++ b/package/minidlna/minidlna.mk
@@ -6,7 +6,7 @@
 
 MINIDLNA_VERSION = 1.1.5
 MINIDLNA_SITE = http://downloads.sourceforge.net/project/minidlna/minidlna/$(MINIDLNA_VERSION)
-MINIDLNA_LICENSE = GPLv2 BSD-3c
+MINIDLNA_LICENSE = GPLv2, BSD-3c
 MINIDLNA_LICENSE_FILES = COPYING LICENCE.miniupnpd
 
 MINIDLNA_DEPENDENCIES = \
