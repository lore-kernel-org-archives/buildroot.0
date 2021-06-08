From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Jun 2021 09:12:32 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/mini-snmpd: add
 CPE variables
Message-ID: <20210608064257.87B958789D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=971cd9e294cedad59db7dd21dcc9159d71ad3b6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:minisnmpd_project:minisnmpd is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aminisnmpd_project%3Aminisnmpd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 5dfb873acfd85196fe141a3e5b9fd170a4c36094)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mini-snmpd/mini-snmpd.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mini-snmpd/mini-snmpd.mk b/package/mini-snmpd/mini-snmpd.mk
index 570241c256..1f6e5c1919 100644
--- a/package/mini-snmpd/mini-snmpd.mk
+++ b/package/mini-snmpd/mini-snmpd.mk
@@ -8,6 +8,8 @@ MINI_SNMPD_VERSION = 1.6
 MINI_SNMPD_SITE = $(call github,troglobit,mini-snmpd,v$(MINI_SNMPD_VERSION))
 MINI_SNMPD_LICENSE = GPL-2.0
 MINI_SNMPD_LICENSE_FILES = COPYING
+MINI_SNMPD_CPE_ID_VENDOR = minisnmpd_project
+MINI_SNMPD_CPE_ID_PRODUCT = minisnmpd
 MINI_SNMPD_AUTORECONF = YES
 MINI_SNMPD_DEPENDENCIES = host-pkgconf
 
