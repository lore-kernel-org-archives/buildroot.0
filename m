From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 23 Jun 2010 23:13:48 +0200
Subject: [Buildroot] [git commit master 1/1] Makefile.autotools.in fix typo
	(s/extrators/extractors/)
Message-ID: <20100623211450.25BE88177D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d39ca39269b340cfc9a1618f470543db91565cba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Noticed by Michael S. Zick.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.package.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 2769707..16ce16a 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -55,7 +55,7 @@ define KCONFIG_DISABLE_OPT
        echo "# $(1) is not set" >> $(2)
 endef
 
-# Define extrators for different archive suffixes
+# Define extractors for different archive suffixes
 INFLATE.bz2  = $(BZCAT)
 INFLATE.gz   = $(ZCAT)
 INFLATE.tbz  = $(BZCAT)
-- 
1.7.1
