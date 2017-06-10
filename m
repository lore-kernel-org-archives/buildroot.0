From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jun 2017 23:10:17 +0200
Subject: [Buildroot] [git commit] erlang-p1-xml: Add host dependencies
Message-ID: <20170610211022.D8828816A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0ea16a9fcf1f0748bd30183d9f937a3ea2f2fb27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This should fix the error reported by autobuild:
http://autobuild.buildroot.net/results/3b4/3b474323cb50d0d5d09611fa068a9d1bd3bd4bb5/

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/erlang-p1-xml/erlang-p1-xml.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/erlang-p1-xml/erlang-p1-xml.mk b/package/erlang-p1-xml/erlang-p1-xml.mk
index 1e43400..0b0b1ca 100644
--- a/package/erlang-p1-xml/erlang-p1-xml.mk
+++ b/package/erlang-p1-xml/erlang-p1-xml.mk
@@ -9,6 +9,7 @@ ERLANG_P1_XML_SITE = $(call github,processone,fast_xml,$(ERLANG_P1_XML_VERSION))
 ERLANG_P1_XML_LICENSE = Apache-2.0
 ERLANG_P1_XML_LICENSE_FILES = LICENSE.txt
 ERLANG_P1_XML_DEPENDENCIES = expat erlang-p1-utils
+ERLANG_P1_XML_HOST_DEPENDENCIES = host-expat host-erlang-p1-utils
 ERLANG_P1_XML_INSTALL_STAGING = YES
 
 ERLANG_P1_XML_USE_AUTOCONF = YES
