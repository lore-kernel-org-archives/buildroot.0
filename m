From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jul 2015 12:27:14 +0200
Subject: [Buildroot] [git commit] erlang-p1-xml: bump to version 2c61083
Message-ID: <20150711103326.4AEC3803E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4ac92ba69d3d10c4313f9e5821b227b1310f2197
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/erlang-p1-xml/erlang-p1-xml.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
