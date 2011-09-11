From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 12 Sep 2011 00:08:17 +0200
Subject: [Buildroot] [git commit] gamin: remove --program-prefix
Message-ID: <20110912052634.E5D758D58C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ed8619dafa809dff6d5ef1e5c3365016fd96d305
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--program-prefix is now set in the auto-target infrastructure.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gamin/gamin.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gamin/gamin.mk b/package/gamin/gamin.mk
index d691f60..326fd62 100644
--- a/package/gamin/gamin.mk
+++ b/package/gamin/gamin.mk
@@ -9,7 +9,7 @@ GAMIN_SITE = http://www.gnome.org/~veillard/gamin/sources
 GAMIN_AUTORECONF = YES
 GAMIN_INSTALL_STAGING = YES
 
-GAMIN_CONF_OPT = --program-prefix="" --disable-debug
+GAMIN_CONF_OPT = --disable-debug
 
 # python support broken
 GAMIN_CONF_OPT += --without-python
-- 
1.7.3.4
