From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 6 Jan 2020 21:24:44 +0100
Subject: [Buildroot] [git commit] package/erlang-p1-xml: bump to version
 1.1.37
Message-ID: <20200106201550.55B9A8EE9E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a07c4ef0c71577a3f44b5876fccdcbb28fec5510
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/erlang-p1-xml/erlang-p1-xml.hash | 2 +-
 package/erlang-p1-xml/erlang-p1-xml.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-xml/erlang-p1-xml.hash b/package/erlang-p1-xml/erlang-p1-xml.hash
index ac8042da64..fc70167579 100644
--- a/package/erlang-p1-xml/erlang-p1-xml.hash
+++ b/package/erlang-p1-xml/erlang-p1-xml.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 8615f77a1448e297af25f85261b6e4a84952af797da2e317c8ec71fe2fe779ac erlang-p1-xml-1.1.34.tar.gz
+sha256 f3226683ec9c8406147a025beebb5b9ed0adcb28099b7c4bb9435a369e9ac3f9 erlang-p1-xml-1.1.37.tar.gz
diff --git a/package/erlang-p1-xml/erlang-p1-xml.mk b/package/erlang-p1-xml/erlang-p1-xml.mk
index c8c65ff423..c66bd25776 100644
--- a/package/erlang-p1-xml/erlang-p1-xml.mk
+++ b/package/erlang-p1-xml/erlang-p1-xml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_XML_VERSION = 1.1.34
+ERLANG_P1_XML_VERSION = 1.1.37
 ERLANG_P1_XML_SITE = $(call github,processone,fast_xml,$(ERLANG_P1_XML_VERSION))
 ERLANG_P1_XML_LICENSE = Apache-2.0
 ERLANG_P1_XML_LICENSE_FILES = LICENSE.txt
