From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Mar 2021 14:08:52 +0100
Subject: [Buildroot] [git commit branch/2021.02.x] package/ejabberd: add
 EJABBERD_CPE_ID_VENDOR
Message-ID: <20210324133906.A4E4F873DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c14d48bfdb25f86ddf469169a7d249cc3c8dddf8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:process-one:ejabberd is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aprocess-one%3Aejabberd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 61aee0d75b41fe8b79ebdb6056882e07cbfc10bf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ejabberd/ejabberd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ejabberd/ejabberd.mk b/package/ejabberd/ejabberd.mk
index a0b4a63542..2b23701ddf 100644
--- a/package/ejabberd/ejabberd.mk
+++ b/package/ejabberd/ejabberd.mk
@@ -9,6 +9,7 @@ EJABBERD_SOURCE = ejabberd-$(EJABBERD_VERSION).tgz
 EJABBERD_SITE = https://static.process-one.net/ejabberd/downloads/$(EJABBERD_VERSION)
 EJABBERD_LICENSE = GPL-2.0+ with OpenSSL exception
 EJABBERD_LICENSE_FILES = COPYING
+EJABBERD_CPE_ID_VENDOR = process-one
 EJABBERD_DEPENDENCIES = getent openssl erlang-eimp host-erlang-lager \
 	erlang-lager erlang-p1-cache-tab erlang-p1-sip \
 	erlang-p1-stringprep erlang-p1-stun erlang-p1-tls \
