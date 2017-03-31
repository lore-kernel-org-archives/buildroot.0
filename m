From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Mar 2017 13:18:33 +0200
Subject: [Buildroot] [git commit] dc3dd: upcase the autoreconf value
Message-ID: <20170331113733.098DD82207@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=11982199f6fd889b37dce325f57c962657db9620
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Beno??t Allard <benoit.allard@greenbone.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dc3dd/dc3dd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dc3dd/dc3dd.mk b/package/dc3dd/dc3dd.mk
index fef9093..2830bb2 100644
--- a/package/dc3dd/dc3dd.mk
+++ b/package/dc3dd/dc3dd.mk
@@ -11,6 +11,6 @@ DC3DD_SITE = https://downloads.sourceforge.net/project/dc3dd/dc3dd/$(DC3DD_VERSI
 DC3DD_LICENSE = GPLv3+
 DC3DD_LICENSE_FILES = COPYING
 # We are patching the Makefile.am
-DC3DD_AUTORECONF = yes
+DC3DD_AUTORECONF = YES
 
 $(eval $(autotools-package))
