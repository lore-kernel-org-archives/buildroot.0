From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 30 Nov 2012 14:30:04 -0800
Subject: [Buildroot] [git commit] sylpheed: add license info
Message-ID: <20121130223215.6559299340@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=98fa43c41746a183ac81b3bf06865ba8e245a061
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sylpheed/sylpheed.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/sylpheed/sylpheed.mk b/package/sylpheed/sylpheed.mk
index cf55c90..f26e5fc 100644
--- a/package/sylpheed/sylpheed.mk
+++ b/package/sylpheed/sylpheed.mk
@@ -8,6 +8,8 @@ SYLPHEED_VERSION_MINOR = 0
 SYLPHEED_VERSION = $(SYLPHEED_VERSION_MAJOR).$(SYLPHEED_VERSION_MINOR)
 SYLPHEED_SOURCE = sylpheed-$(SYLPHEED_VERSION).tar.bz2
 SYLPHEED_SITE = http://sylpheed.sraoss.jp/sylpheed/v$(SYLPHEED_VERSION_MAJOR)
+SYLPHEED_LICENSE = GPLv2+ (executables), LGPLv2.1+ (library, attachment plugin)
+SYLPHEED_LICENSE_FILES = COPIYNG COPYING.LIB
 
 SYLPHEED_CONF_OPT = --disable-gtkspell
 
