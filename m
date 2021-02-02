From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Feb 2021 16:37:35 +0100
Subject: [Buildroot] [git commit] package/qpid-proton: set CPE variables
Message-ID: <20210202152051.4EDA47FE8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=df1470016b55edb09d97b7b3249e5629a045c18e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:apache:qpid_proton is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aapache%3Aqpid_proton

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qpid-proton/qpid-proton.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/qpid-proton/qpid-proton.mk b/package/qpid-proton/qpid-proton.mk
index c501e48c86..ff7d748231 100644
--- a/package/qpid-proton/qpid-proton.mk
+++ b/package/qpid-proton/qpid-proton.mk
@@ -9,6 +9,8 @@ QPID_PROTON_SITE = http://apache.panu.it/qpid/proton/$(QPID_PROTON_VERSION)
 QPID_PROTON_STRIP_COMPONENTS = 2
 QPID_PROTON_LICENSE = Apache-2.0
 QPID_PROTON_LICENSE_FILES = LICENSE
+QPID_PROTON_CPE_ID_VENDOR = apache
+QPID_PROTON_CPE_ID_PRODUCT = qpid_proton
 QPID_PROTON_INSTALL_STAGING = YES
 QPID_PROTON_DEPENDENCIES = \
 	host-python \
