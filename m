From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 13 Feb 2021 22:27:54 +0100
Subject: [Buildroot] [git commit] package/fetchmail: set
 FETCHMAIL_CPE_ID_VENDOR
Message-ID: <20210213210640.3173E83978@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=15fc28a79f3cbd6f7e399f29a7c11336239c3fd2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:fetchmail:fetchmail is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Afetchmail%3Afetchmail

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fetchmail/fetchmail.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index 788560510f..2db635ec66 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -10,6 +10,7 @@ FETCHMAIL_SOURCE = fetchmail-$(FETCHMAIL_VERSION).tar.xz
 FETCHMAIL_SITE = http://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)
 FETCHMAIL_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
 FETCHMAIL_LICENSE_FILES = COPYING
+FETCHMAIL_CPE_ID_VENDOR = fetchmail
 
 FETCHMAIL_CONF_OPTS = \
 	--with-ssl=$(STAGING_DIR)/usr
