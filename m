From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 21 Jan 2013 23:47:51 +0100
Subject: [Buildroot] [git commit] gzip: add license information
Message-ID: <20130121225447.AFAD89A6BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=194f479ca7a5fbaa8abdc2d93b50b78c3ed5b2b9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gzip/gzip.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/gzip/gzip.mk b/package/gzip/gzip.mk
index 0c5c124..821f694 100644
--- a/package/gzip/gzip.mk
+++ b/package/gzip/gzip.mk
@@ -6,5 +6,7 @@
 
 GZIP_VERSION = 1.5
 GZIP_SITE = $(BR2_GNU_MIRROR)/gzip
+GZIP_LICENSE = GPLv3+
+GZIP_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
