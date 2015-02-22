From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Feb 2015 22:22:57 +0100
Subject: [Buildroot] [git commit branch/next] package/freerdp: fix a comment
Message-ID: <20150222212523.3BAD2807A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b3845ee523709e868e8093bb7716f58bb148638e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freerdp/freerdp.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 37568c0..50b8f18 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -176,6 +176,6 @@ else # ! SERVER && ! CLIENT
 
 FREERDP_CONF_OPTS += -DWITH_X11=OFF
 
-endif # ! USES_XLIBS
+endif # ! SERVER && ! CLIENT
 
 $(eval $(cmake-package))
