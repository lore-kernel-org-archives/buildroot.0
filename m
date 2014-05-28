From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 May 2014 23:28:57 +0200
Subject: [Buildroot] [git commit] package/exim: security bump
Message-ID: <20140528221103.022DE9CDF6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=413174e6fb1f8c5e9eb1ec6b620641ae1a73a3bf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump exim to get an urgent security fix.

We should not be impacted, since we're not building with DMARC (where
the flaw is), but better safe than sorry.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/exim/exim.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index b780b85..0f9c6af 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXIM_VERSION = 4.82
+EXIM_VERSION = 4.82.1
 EXIM_SOURCE = exim-$(EXIM_VERSION).tar.bz2
 EXIM_SITE = ftp://ftp.exim.org/pub/exim/exim4
 EXIM_LICENSE = GPLv2+
