From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Jan 2021 20:37:12 +0100
Subject: [Buildroot] [git commit] package/rhash: set RHASH_CPE_ID_VALID
Message-ID: <20210119191808.B29A388369@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad92bc0e73af294049016eaa8f9993861f8675d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:rhash_project:rhash is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Arhash_project%3Arhash

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rhash/rhash.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rhash/rhash.mk b/package/rhash/rhash.mk
index 1682676dac..4438112f3f 100644
--- a/package/rhash/rhash.mk
+++ b/package/rhash/rhash.mk
@@ -9,6 +9,7 @@ RHASH_SOURCE = rhash-$(RHASH_VERSION)-src.tar.gz
 RHASH_SITE = https://sourceforge.net/projects/rhash/files/rhash/$(RHASH_VERSION)
 RHASH_LICENSE = 0BSD
 RHASH_LICENSE_FILES = COPYING
+RHASH_CPE_ID_VALID = YES
 RHASH_INSTALL_STAGING = YES
 RHASH_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 RHASH_ADDLDFLAGS = $(TARGET_NLS_LIBS)
