From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 20 Mar 2021 20:13:07 +0100
Subject: [Buildroot] [PATCH 1/1] package/ejabberd: add EJABBERD_CPE_ID_VENDOR
Message-ID: <20210320191307.447349-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:process-one:ejabberd is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aprocess-one%3Aejabberd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.30.1
