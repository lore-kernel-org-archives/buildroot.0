From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Feb 2021 10:30:27 +0100
Subject: [Buildroot] [git commit] package/slirp: add CPE variables
Message-ID: <20210207091616.27558807E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2bf6bbc180f56287493258ed70411e83b7520e6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:libslirp_project:libslirp is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibslirp_project%3Alibslirp

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/slirp/slirp.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/slirp/slirp.mk b/package/slirp/slirp.mk
index 33c568c058..ff92c60517 100644
--- a/package/slirp/slirp.mk
+++ b/package/slirp/slirp.mk
@@ -11,6 +11,8 @@ SLIRP_SOURCE = libslirp-$(SLIRP_VERSION).tar.xz
 SLIRP_SITE = https://elmarco.fedorapeople.org
 SLIRP_LICENSE = BSD-3-Clause
 SLIRP_LICENSE_FILES = COPYRIGHT
+SLIRP_CPE_ID_VENDOR = libslirp_project
+SLIRP_CPE_ID_PRODUCT = libslirp
 SLIRP_INSTALL_STAGING = YES
 SLIRP_DEPENDENCIES = libglib2
 
