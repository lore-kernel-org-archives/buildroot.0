From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Jul 2014 00:37:52 +0200
Subject: [Buildroot] [git commit] sawman: add license information
Message-ID: <20140701224922.684B69D12D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=71183f10c90a9d4b393da24ddd165e50df276823
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sawman/sawman.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/sawman/sawman.mk b/package/sawman/sawman.mk
index 00516ca..559235f 100644
--- a/package/sawman/sawman.mk
+++ b/package/sawman/sawman.mk
@@ -10,5 +10,7 @@ SAWMAN_SITE = http://www.directfb.org/downloads/Extras
 SAWMAN_INSTALL_STAGING = YES
 SAWMAN_AUTORECONF = YES
 SAWMAN_DEPENDENCIES = directfb
+SAWMAN_LICENSE = LGPLv2.1+
+SAWMAN_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
