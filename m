From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Feb 2021 20:01:28 +0100
Subject: [Buildroot] [git commit] package/matio: set MATIO_CPE_ID_VALID
Message-ID: <20210210184152.5EC7583976@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f3e8e95ceaf3ddecf1a24e97c8ba60e859f6afb7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:matio_project:matio is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Amatio_project%3Amatio

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/matio/matio.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/matio/matio.mk b/package/matio/matio.mk
index 230dbf2374..eb83632746 100644
--- a/package/matio/matio.mk
+++ b/package/matio/matio.mk
@@ -8,6 +8,7 @@ MATIO_VERSION = 1.5.18
 MATIO_SITE = http://downloads.sourceforge.net/project/matio/matio/$(MATIO_VERSION)
 MATIO_LICENSE = BSD-2-Clause
 MATIO_LICENSE_FILES = COPYING
+MATIO_CPE_ID_VALID = YES
 MATIO_DEPENDENCIES = zlib
 MATIO_INSTALL_STAGING = YES
 
