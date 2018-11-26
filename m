From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon, 26 Nov 2018 12:07:58 +0100
Subject: [Buildroot] [PATCH 06/15] erlang-p1-xml: Bump to version 1.1.34
In-Reply-To: <20181126110807.31431-1-johan.oudinet@gmail.com>
References: <20181126110807.31431-1-johan.oudinet@gmail.com>
Message-ID: <20181126110807.31431-7-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-xml/erlang-p1-xml.hash | 2 +-
 package/erlang-p1-xml/erlang-p1-xml.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-xml/erlang-p1-xml.hash b/package/erlang-p1-xml/erlang-p1-xml.hash
index ae3f3241c6..ac8042da64 100644
--- a/package/erlang-p1-xml/erlang-p1-xml.hash
+++ b/package/erlang-p1-xml/erlang-p1-xml.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 aeda4051c08b78e2f036d82705433a667d03736f07ff0054862e82105435e285 erlang-p1-xml-1.1.25.tar.gz
+sha256 8615f77a1448e297af25f85261b6e4a84952af797da2e317c8ec71fe2fe779ac erlang-p1-xml-1.1.34.tar.gz
diff --git a/package/erlang-p1-xml/erlang-p1-xml.mk b/package/erlang-p1-xml/erlang-p1-xml.mk
index ff9999834d..c8c65ff423 100644
--- a/package/erlang-p1-xml/erlang-p1-xml.mk
+++ b/package/erlang-p1-xml/erlang-p1-xml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_XML_VERSION = 1.1.25
+ERLANG_P1_XML_VERSION = 1.1.34
 ERLANG_P1_XML_SITE = $(call github,processone,fast_xml,$(ERLANG_P1_XML_VERSION))
 ERLANG_P1_XML_LICENSE = Apache-2.0
 ERLANG_P1_XML_LICENSE_FILES = LICENSE.txt
-- 
2.17.1
