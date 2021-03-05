From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  5 Mar 2021 10:49:57 +0100
Subject: [Buildroot] [PATCH 1/1] package/erlang: add CPE variables
Message-ID: <20210305094957.1833012-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:erlang:erlang\/otp is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&orderBy=2.3&keyword=cpe%3A2.3%3Aa%3Aerlang%3Aerlang%5C%2Fotp&status=FINAL

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/erlang/erlang.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index 9cedb62e05..59fcdba93f 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -12,6 +12,8 @@ ERLANG_DEPENDENCIES = host-erlang
 
 ERLANG_LICENSE = Apache-2.0
 ERLANG_LICENSE_FILES = LICENSE.txt
+ERLANG_CPE_ID_VENDOR = erlang
+ERLANG_CPE_ID_PRODUCT = erlang\/otp
 ERLANG_INSTALL_STAGING = YES
 
 # Remove the leftover deps directory from the ssl app
-- 
2.30.0
