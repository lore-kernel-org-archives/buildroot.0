From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Mar 2021 13:58:11 +0100
Subject: [Buildroot] [git commit] package/dosfstools: set
 DOSFSTOOLS_CPE_ID_VALID
Message-ID: <20210305123919.DD37F817D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=95fe85b2733b026391abe843705baafed50b58df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:dosfstools_project:dosfstools is a valid CPE identifier for
this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Adosfstools_project%3Adosfstools

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dosfstools/dosfstools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
index fdf973af9d..b876649b90 100644
--- a/package/dosfstools/dosfstools.mk
+++ b/package/dosfstools/dosfstools.mk
@@ -9,6 +9,7 @@ DOSFSTOOLS_SOURCE = dosfstools-$(DOSFSTOOLS_VERSION).tar.xz
 DOSFSTOOLS_SITE = https://github.com/dosfstools/dosfstools/releases/download/v$(DOSFSTOOLS_VERSION)
 DOSFSTOOLS_LICENSE = GPL-3.0+
 DOSFSTOOLS_LICENSE_FILES = COPYING
+DOSFSTOOLS_CPE_ID_VALID = YES
 DOSFSTOOLS_CONF_OPTS = --enable-compat-symlinks --exec-prefix=/
 HOST_DOSFSTOOLS_CONF_OPTS = --enable-compat-symlinks
 
