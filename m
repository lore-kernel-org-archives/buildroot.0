From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 14 Nov 2012 22:37:15 +0100
Subject: [Buildroot] [git commit] popt: add license info
Message-ID: <20121114214732.CDA7C99B26@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3f4ccf9d708c35c4343d7578b632b6ffc69c5b31
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/popt/popt.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/popt/popt.mk b/package/popt/popt.mk
index df49acb..fb3a766 100644
--- a/package/popt/popt.mk
+++ b/package/popt/popt.mk
@@ -7,6 +7,8 @@ POPT_VERSION = 1.16
 # rpm5.org down
 POPT_SITE = http://anduin.linuxfromscratch.org/sources/BLFS/svn/p/
 POPT_INSTALL_STAGING = YES
+POPT_LICENSE = MIT
+POPT_LICENSE_FILES = COPYING
 
 POPT_CONF_ENV = ac_cv_va_copy=yes
 
