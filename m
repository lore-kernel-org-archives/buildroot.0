From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 22:45:17 +0100
Subject: [Buildroot] [git commit] luasec: remove LUASEC_VERSION_UPSTREAM
Message-ID: <20170302214521.D953880641@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ac476821f1e006f3a2a7af1a1e6e597d380b8885
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It is not used for anything.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/luasec/luasec.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/luasec/luasec.mk b/package/luasec/luasec.mk
index fd1f1cd..b059e1c 100644
--- a/package/luasec/luasec.mk
+++ b/package/luasec/luasec.mk
@@ -4,8 +4,7 @@
 #
 ################################################################################
 
-LUASEC_VERSION_UPSTREAM = 0.5
-LUASEC_VERSION = $(LUASEC_VERSION_UPSTREAM)-2
+LUASEC_VERSION = 0.5-2
 LUASEC_SUBDIR = luasec
 LUASEC_LICENSE = MIT
 LUASEC_LICENSE_FILES = $(LUASEC_SUBDIR)/LICENSE
