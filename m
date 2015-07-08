From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Wed,  8 Jul 2015 11:54:21 +0200
Subject: [Buildroot] [PATCH 08/11] erlang-p1-xml: bump to version 2c61083
In-Reply-To: <1436349264-11797-1-git-send-email-johan.oudinet@gmail.com>
References: <1436349264-11797-1-git-send-email-johan.oudinet@gmail.com>
Message-ID: <1436349264-11797-9-git-send-email-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-xml/erlang-p1-xml.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/erlang-p1-xml/erlang-p1-xml.mk b/package/erlang-p1-xml/erlang-p1-xml.mk
index 3bcac66..f81d3e5 100644
--- a/package/erlang-p1-xml/erlang-p1-xml.mk
+++ b/package/erlang-p1-xml/erlang-p1-xml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_XML_VERSION = b530983
+ERLANG_P1_XML_VERSION = 2c61083
 ERLANG_P1_XML_SITE = $(call github,processone,xml,$(ERLANG_P1_XML_VERSION))
 ERLANG_P1_XML_LICENSE = GPLv2+
 ERLANG_P1_XML_LICENSE_FILES = COPYING
-- 
2.1.4
