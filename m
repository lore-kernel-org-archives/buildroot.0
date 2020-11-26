From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Thu, 26 Nov 2020 18:42:49 +0100
Subject: [Buildroot] [PATCH 06/18] package/erlang-p1-xml: bump version to
 1.1.44
In-Reply-To: <20201126174301.411219-1-johan.oudinet@gmail.com>
References: <20201126174301.411219-1-johan.oudinet@gmail.com>
Message-ID: <20201126174301.411219-6-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-xml/erlang-p1-xml.hash | 4 ++--
 package/erlang-p1-xml/erlang-p1-xml.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/erlang-p1-xml/erlang-p1-xml.hash b/package/erlang-p1-xml/erlang-p1-xml.hash
index 07e640341a..f2a4ab83e0 100644
--- a/package/erlang-p1-xml/erlang-p1-xml.hash
+++ b/package/erlang-p1-xml/erlang-p1-xml.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 f3226683ec9c8406147a025beebb5b9ed0adcb28099b7c4bb9435a369e9ac3f9 erlang-p1-xml-1.1.37.tar.gz
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 LICENSE.txt
+sha256  739f37a161a570071469ab1f3d8fc232f004ea616700fe7e46b6d8afa9d03a60  erlang-p1-xml-1.1.44.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-p1-xml/erlang-p1-xml.mk b/package/erlang-p1-xml/erlang-p1-xml.mk
index c66bd25776..5730181ac6 100644
--- a/package/erlang-p1-xml/erlang-p1-xml.mk
+++ b/package/erlang-p1-xml/erlang-p1-xml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_XML_VERSION = 1.1.37
+ERLANG_P1_XML_VERSION = 1.1.44
 ERLANG_P1_XML_SITE = $(call github,processone,fast_xml,$(ERLANG_P1_XML_VERSION))
 ERLANG_P1_XML_LICENSE = Apache-2.0
 ERLANG_P1_XML_LICENSE_FILES = LICENSE.txt
-- 
2.25.1
