From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Aug 2012 12:55:44 +0200
Subject: [Buildroot] [git commit] fbdump: add license info
Message-ID: <20120821110312.8FB9997206@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0b258da9074b22ce11de34750c29d910ca391afd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fbdump/fbdump.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/fbdump/fbdump.mk b/package/fbdump/fbdump.mk
index 176d254..3ca10bf 100644
--- a/package/fbdump/fbdump.mk
+++ b/package/fbdump/fbdump.mk
@@ -6,6 +6,7 @@
 FBDUMP_VERSION:=0.4.2
 FBDUMP_SOURCE:=fbdump-$(FBDUMP_VERSION).tar.gz
 FBDUMP_SITE:=http://www.rcdrummond.net/fbdump
+FBDUMP_LICENSE = GPLv2
+FBDUMP_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
-
