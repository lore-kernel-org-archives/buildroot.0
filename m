From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Mar 2021 13:58:55 +0100
Subject: [Buildroot] [git commit] package/erlang: add CPE variables
Message-ID: <20210305123920.10207817D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c9052d92b0ddd764a91552e0175ee12e44853ab6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:erlang:erlang\/otp is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&orderBy=2.3&keyword=cpe%3A2.3%3Aa%3Aerlang%3Aerlang%5C%2Fotp&status=FINAL

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
