From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Dec 2014 12:00:51 +0100
Subject: [Buildroot] [git commit] lpeg: bump to version 0.12.1
Message-ID: <20141224111107.4551A7FA48@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6d4fca50730b155cb5e292f981e81bfc9dc22b2a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lpeg/lpeg.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lpeg/lpeg.mk b/package/lpeg/lpeg.mk
index a9759e5..52fb7b7 100644
--- a/package/lpeg/lpeg.mk
+++ b/package/lpeg/lpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LPEG_VERSION = 0.12-1
+LPEG_VERSION = 0.12.1-1
 LPEG_LICENSE = MIT
 
 $(eval $(luarocks-package))
