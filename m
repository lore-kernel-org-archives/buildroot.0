From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Jun 2013 21:37:10 +0200
Subject: [Buildroot] [git commit] findutils: define license
Message-ID: <20130628195144.222B99B292@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=781771cf1e0f1599f648cc1cc2fb7d3f778535c7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/findutils/findutils.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/findutils/findutils.mk b/package/findutils/findutils.mk
index 464f28b..d9b6050 100644
--- a/package/findutils/findutils.mk
+++ b/package/findutils/findutils.mk
@@ -6,6 +6,8 @@
 
 FINDUTILS_VERSION = 4.4.2
 FINDUTILS_SITE = $(BR2_GNU_MIRROR)/findutils
+FINDUTILS_LICENSE = GPLv3+
+FINDUTILS_LICENSE_FILES = COPYING
 FINDUTILS_CONF_ENV = gl_cv_func_stdin=yes \
 			gl_cv_func_wcwidth_works=yes
 
