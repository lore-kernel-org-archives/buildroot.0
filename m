From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 13 Jan 2013 21:12:18 +0100
Subject: [Buildroot] [git commit] lzop: add host build
Message-ID: <20130113201242.D60D899884@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=63f7e72a28a1c30ad7d4b7765776bf71a93a05aa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Barebox needs host-lzop.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lzop/lzop.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/lzop/lzop.mk b/package/lzop/lzop.mk
index 4ab8a4a..1f7c835 100644
--- a/package/lzop/lzop.mk
+++ b/package/lzop/lzop.mk
@@ -11,3 +11,4 @@ LZOP_LICENSE_FILES = COPYING
 LZOP_DEPENDENCIES = lzo
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
