From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Nov 2013 01:32:06 +0100
Subject: [Buildroot] [git commit] xmlstarlet: add license information
Message-ID: <20131111003655.8985F9BB60@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=270db93d7bf5dc8c2f742b4238253aea8591ec49
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Acked-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xmlstarlet/xmlstarlet.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/xmlstarlet/xmlstarlet.mk b/package/xmlstarlet/xmlstarlet.mk
index f0a26c2..4a30feb 100644
--- a/package/xmlstarlet/xmlstarlet.mk
+++ b/package/xmlstarlet/xmlstarlet.mk
@@ -6,6 +6,8 @@
 
 XMLSTARLET_VERSION = 1.3.0
 XMLSTARLET_SITE = http://downloads.sourceforge.net/project/xmlstar/xmlstarlet/$(XMLSTARLET_VERSION)
+XMLSTARLET_LICENSE = MIT
+XMLSTARLET_LICENSE_FILES = COPYING
 
 XMLSTARLET_DEPENDENCIES += libxml2 libxslt \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
