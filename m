From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 May 2021 22:26:32 +0200
Subject: [Buildroot] [git commit] package/pulseaudio: add
 PULSEAUDIO_CPE_ID_VENDOR
Message-ID: <20210522200125.DB07988766@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=27c764153abae370106451779e88c32a6ba62c1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:pulseaudio:pulseaudio is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apulseaudio%3Apulseaudio

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pulseaudio/pulseaudio.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index 6dfb1f8647..19e08f55ae 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -10,6 +10,7 @@ PULSEAUDIO_SITE = https://freedesktop.org/software/pulseaudio/releases
 PULSEAUDIO_INSTALL_STAGING = YES
 PULSEAUDIO_LICENSE = LGPL-2.1+ (specific license for modules, see LICENSE file)
 PULSEAUDIO_LICENSE_FILES = LICENSE GPL LGPL
+PULSEAUDIO_CPE_ID_VENDOR = pulseaudio
 PULSEAUDIO_CONF_OPTS = \
 	--disable-default-build-tests \
 	--disable-legacy-database-entry-format \
