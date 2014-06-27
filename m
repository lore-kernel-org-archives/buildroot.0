From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Jun 2014 08:47:00 +0200
Subject: [Buildroot] [git commit] gqview: add license information
Message-ID: <20140627070642.58CF09D0D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=baa330e227689f36fd62b8606f3a0df299d86032
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gqview/gqview.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/gqview/gqview.mk b/package/gqview/gqview.mk
index 07cb5ad..8962025 100644
--- a/package/gqview/gqview.mk
+++ b/package/gqview/gqview.mk
@@ -8,5 +8,7 @@ GQVIEW_VERSION = 2.1.5
 GQVIEW_SITE = http://prdownloads.sourceforge.net/gqview
 GQVIEW_DEPENDENCIES = host-pkgconf libgtk2
 GQVIEW_CONF_ENV = LIBS="-lm"
+GQVIEW_LICENSE = GPLv2
+GQVIEW_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
