From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 7 Jun 2021 23:40:34 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/msmtp: add
 MSMTP_CPE_ID_VENDOR
Message-ID: <20210607211334.ECAB1815C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ddeadc09a8b5d7be32dfbcf439278a2cb24e3702
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:marlam:msmtp is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Amarlam%3Amsmtp

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit bf85592a46fbe244b5620baae02a9cf067ad1c23)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/msmtp/msmtp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/msmtp/msmtp.mk b/package/msmtp/msmtp.mk
index cae03d7724..3db36f4cd0 100644
--- a/package/msmtp/msmtp.mk
+++ b/package/msmtp/msmtp.mk
@@ -11,6 +11,7 @@ MSMTP_DEPENDENCIES = host-pkgconf
 MSMTP_CONF_OPTS = --disable-gai-idn
 MSMTP_LICENSE = GPL-3.0+
 MSMTP_LICENSE_FILES = COPYING
+MSMTP_CPE_ID_VENDOR = marlam
 
 # msmtpd needs fork
 ifeq ($(BR2_USE_MMU),y)
