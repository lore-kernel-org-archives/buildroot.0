From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue,  7 Jan 2020 12:48:00 +0100
Subject: [Buildroot] [PATCH 1/2] package/erlang-*: add hash for license files
Message-ID: <20200107114801.25624-1-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-eimp/erlang-eimp.hash                   | 1 +
 package/erlang-goldrush/erlang-goldrush.hash           | 1 +
 package/erlang-jiffy/erlang-jiffy.hash                 | 1 +
 package/erlang-lager/erlang-lager.hash                 | 1 +
 package/erlang-p1-cache-tab/erlang-p1-cache-tab.hash   | 1 +
 package/erlang-p1-oauth2/erlang-p1-oauth2.hash         | 1 +
 package/erlang-p1-pkix/erlang-p1-pkix.hash             | 1 +
 package/erlang-p1-sip/erlang-p1-sip.hash               | 1 +
 package/erlang-p1-stringprep/erlang-p1-stringprep.hash | 3 +++
 package/erlang-p1-stun/erlang-p1-stun.hash             | 1 +
 package/erlang-p1-tls/erlang-p1-tls.hash               | 1 +
 package/erlang-p1-utils/erlang-p1-utils.hash           | 1 +
 package/erlang-p1-xml/erlang-p1-xml.hash               | 1 +
 package/erlang-p1-xmpp/erlang-p1-xmpp.hash             | 1 +
 package/erlang-p1-yaml/erlang-p1-yaml.hash             | 1 +
 package/erlang-p1-zlib/erlang-p1-zlib.hash             | 1 +
 package/erlang-rebar/erlang-rebar.hash                 | 1 +
 17 files changed, 19 insertions(+)

diff --git a/package/erlang-eimp/erlang-eimp.hash b/package/erlang-eimp/erlang-eimp.hash
index 2b16ba5e57..604e05a026 100644
--- a/package/erlang-eimp/erlang-eimp.hash
+++ b/package/erlang-eimp/erlang-eimp.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256 dfcdc211480f974175af615616c7f8c1e8f9dff5d6be5faa3f20c3eb4c60240e erlang-eimp-1.0.12.tar.gz
+sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 LICENSE.txt
\ No newline at end of file
diff --git a/package/erlang-goldrush/erlang-goldrush.hash b/package/erlang-goldrush/erlang-goldrush.hash
index d575aa49b2..275982dc39 100644
--- a/package/erlang-goldrush/erlang-goldrush.hash
+++ b/package/erlang-goldrush/erlang-goldrush.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256 6fb8ac6345d940396ecf89d4ce6b9b809039f336d85d7a54239e85106a807612 erlang-goldrush-0.1.9.tar.gz
+sha256 335dd315c1bf12bd9bde777666c45e92652c9fe633101b12fc6f927b88433b6f LICENSE
\ No newline at end of file
diff --git a/package/erlang-jiffy/erlang-jiffy.hash b/package/erlang-jiffy/erlang-jiffy.hash
index 4a201fe5d6..d9e0c3e4f0 100644
--- a/package/erlang-jiffy/erlang-jiffy.hash
+++ b/package/erlang-jiffy/erlang-jiffy.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 c555726f592b79894c253ca1dc3c3aec6a5697271d29364d57f8175f387b86f3 erlang-jiffy-0.14.11.tar.gz
+sha256 0fa8afad2f02c08850a16e36fe55376ee19732b3a116a0207f2a73c857777a49 LICENSE
\ No newline at end of file
diff --git a/package/erlang-lager/erlang-lager.hash b/package/erlang-lager/erlang-lager.hash
index 26bfabbdea..7ba444b1c7 100644
--- a/package/erlang-lager/erlang-lager.hash
+++ b/package/erlang-lager/erlang-lager.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256 c5bb4ba6f918e90d2e6671c3996d72c61f2a589b65c151b3df8011d046362981 erlang-lager-3.6.10.tar.gz
+sha256 809fa1ed21450f59827d1e9aec720bbc4b687434fa22283c6cb5dd82a47ab9c0 LICENSE
\ No newline at end of file
diff --git a/package/erlang-p1-cache-tab/erlang-p1-cache-tab.hash b/package/erlang-p1-cache-tab/erlang-p1-cache-tab.hash
index 7e3800a6b0..2549b01f5d 100644
--- a/package/erlang-p1-cache-tab/erlang-p1-cache-tab.hash
+++ b/package/erlang-p1-cache-tab/erlang-p1-cache-tab.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256 572b6532dca59c561d994bf2bf8eed3637118c64cdd3a9e51d81b506f5b09e2c erlang-p1-cache-tab-1.0.20.tar.gz
+sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 LICENSE.txt
\ No newline at end of file
diff --git a/package/erlang-p1-oauth2/erlang-p1-oauth2.hash b/package/erlang-p1-oauth2/erlang-p1-oauth2.hash
index 1a4211c1d2..5d81572560 100644
--- a/package/erlang-p1-oauth2/erlang-p1-oauth2.hash
+++ b/package/erlang-p1-oauth2/erlang-p1-oauth2.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256 55bf54133ce0882fab59f813ddf9ed4dac1e051a53fb4bd1c0565136ebb4d6ac erlang-p1-oauth2-0.6.5.tar.gz
+sha256 0ecddd0a5e35b7fcdab451f54c5bb688fac8365cdf6b0da0ac64b7895a0770f3 LICENSE
\ No newline at end of file
diff --git a/package/erlang-p1-pkix/erlang-p1-pkix.hash b/package/erlang-p1-pkix/erlang-p1-pkix.hash
index cb6004f6b2..656821bd1c 100644
--- a/package/erlang-p1-pkix/erlang-p1-pkix.hash
+++ b/package/erlang-p1-pkix/erlang-p1-pkix.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256 184069d9055991cb8b7bd07dde8737a0a793e66e1ec1020deb680f83260a3e82 erlang-p1-pkix-1.0.4.tar.gz
+sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 LICENSE
\ No newline at end of file
diff --git a/package/erlang-p1-sip/erlang-p1-sip.hash b/package/erlang-p1-sip/erlang-p1-sip.hash
index 4fd5024ffb..bdd7dace44 100644
--- a/package/erlang-p1-sip/erlang-p1-sip.hash
+++ b/package/erlang-p1-sip/erlang-p1-sip.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256 4c8dbba1dfcbb16a300fea5fd75f5ab2a145f011fa1ebff37e31e1672a9bc285 erlang-p1-sip-1.0.30.tar.gz
+sha256 6e68ca4488fcdacf80ea0a3f5a6a294d48c2d8dc9de520cc3d6b3f3c1bc12847 LICENSE.txt
\ No newline at end of file
diff --git a/package/erlang-p1-stringprep/erlang-p1-stringprep.hash b/package/erlang-p1-stringprep/erlang-p1-stringprep.hash
index c9bf4c7067..9bad87f0e9 100644
--- a/package/erlang-p1-stringprep/erlang-p1-stringprep.hash
+++ b/package/erlang-p1-stringprep/erlang-p1-stringprep.hash
@@ -1,2 +1,5 @@
 # Locally calculated
 sha256 119b751f569baecc4d911ff3c2a6a33a042f8d0b2e64445072d1af14ed935fc0 erlang-p1-stringprep-1.0.17.tar.gz
+sha256 f44415631770cb818de6d92f3961fdfe6e407a5154f84b87cc06ac27323e919c LICENSE.ALL
+sha256 42aef2a1337ef1f45ae2832aa5aa268c79b2560fb1f3ebab519629372cb24ffe LICENSE.TCL
+sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 LICENSE.txt
\ No newline at end of file
diff --git a/package/erlang-p1-stun/erlang-p1-stun.hash b/package/erlang-p1-stun/erlang-p1-stun.hash
index 736ac48e38..d2e0f11828 100644
--- a/package/erlang-p1-stun/erlang-p1-stun.hash
+++ b/package/erlang-p1-stun/erlang-p1-stun.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256 87cfd9d75c7b956b4c26c9e94492737a4528abf4b09f4f7d89a40abaa0dc088a erlang-p1-stun-1.0.29.tar.gz
+sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 LICENSE.txt
\ No newline at end of file
diff --git a/package/erlang-p1-tls/erlang-p1-tls.hash b/package/erlang-p1-tls/erlang-p1-tls.hash
index 5933f3e22f..742ac2af84 100644
--- a/package/erlang-p1-tls/erlang-p1-tls.hash
+++ b/package/erlang-p1-tls/erlang-p1-tls.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256 6444e174650054a53624490155a914b8bea31cdefbcd5f87fc1862102dc1db6e erlang-p1-tls-1.1.2.tar.gz
+sha256 6e68ca4488fcdacf80ea0a3f5a6a294d48c2d8dc9de520cc3d6b3f3c1bc12847 LICENSE.txt
\ No newline at end of file
diff --git a/package/erlang-p1-utils/erlang-p1-utils.hash b/package/erlang-p1-utils/erlang-p1-utils.hash
index cd26340e12..e85d823a4b 100644
--- a/package/erlang-p1-utils/erlang-p1-utils.hash
+++ b/package/erlang-p1-utils/erlang-p1-utils.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256 2559967770558dc003bcc3c7efc216f6c57c4f23830d5de33c6bf61d8a3f880c erlang-p1-utils-1.0.16.tar.gz
+sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 LICENSE.txt
\ No newline at end of file
diff --git a/package/erlang-p1-xml/erlang-p1-xml.hash b/package/erlang-p1-xml/erlang-p1-xml.hash
index fc70167579..2bdbdfee24 100644
--- a/package/erlang-p1-xml/erlang-p1-xml.hash
+++ b/package/erlang-p1-xml/erlang-p1-xml.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256 f3226683ec9c8406147a025beebb5b9ed0adcb28099b7c4bb9435a369e9ac3f9 erlang-p1-xml-1.1.37.tar.gz
+sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 LICENSE.txt
\ No newline at end of file
diff --git a/package/erlang-p1-xmpp/erlang-p1-xmpp.hash b/package/erlang-p1-xmpp/erlang-p1-xmpp.hash
index 5365a03241..658728ad0b 100644
--- a/package/erlang-p1-xmpp/erlang-p1-xmpp.hash
+++ b/package/erlang-p1-xmpp/erlang-p1-xmpp.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256 a192349e256c0c0af46e6d7f46c52e6345e61984a266696bb0346934c434f342 erlang-p1-xmpp-1.4.2.tar.gz
+sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 LICENSE.txt
\ No newline at end of file
diff --git a/package/erlang-p1-yaml/erlang-p1-yaml.hash b/package/erlang-p1-yaml/erlang-p1-yaml.hash
index 4f4c489cf1..37b0f0be8b 100644
--- a/package/erlang-p1-yaml/erlang-p1-yaml.hash
+++ b/package/erlang-p1-yaml/erlang-p1-yaml.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256 b915612c06ef190bfed6d0370906b071274ed4ce4143b668cdad66588a9484a0 erlang-p1-yaml-1.0.21.tar.gz
+sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 LICENSE.txt
\ No newline at end of file
diff --git a/package/erlang-p1-zlib/erlang-p1-zlib.hash b/package/erlang-p1-zlib/erlang-p1-zlib.hash
index 6d3d56a1a0..e84fa9fba3 100644
--- a/package/erlang-p1-zlib/erlang-p1-zlib.hash
+++ b/package/erlang-p1-zlib/erlang-p1-zlib.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256 7d39a3cb92ed7781b6b6ba95704e2591c626d62eddb3c52dcaeac60c339084d7 erlang-p1-zlib-1.0.6.tar.gz
+sha256 6e68ca4488fcdacf80ea0a3f5a6a294d48c2d8dc9de520cc3d6b3f3c1bc12847 LICENSE.txt
\ No newline at end of file
diff --git a/package/erlang-rebar/erlang-rebar.hash b/package/erlang-rebar/erlang-rebar.hash
index 27cc91affc..f7cbb169a5 100644
--- a/package/erlang-rebar/erlang-rebar.hash
+++ b/package/erlang-rebar/erlang-rebar.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256 577246bafa2eb2b2c3f1d0c157408650446884555bf87901508ce71d5cc0bd07 erlang-rebar-2.6.4.tar.gz
+sha256 809fa1ed21450f59827d1e9aec720bbc4b687434fa22283c6cb5dd82a47ab9c0 LICENSE
\ No newline at end of file
-- 
2.20.1
