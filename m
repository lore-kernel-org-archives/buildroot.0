From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Oct 2013 17:10:49 +0200
Subject: [Buildroot] [git commit] conntrack-tools: correct license GPLv2 ->
	GPLv2+
Message-ID: <20131008152142.7C2A69B978@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5546a527bc734e8655685dc46941ade0fdff634a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/conntrack-tools/conntrack-tools.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/conntrack-tools/conntrack-tools.mk b/package/conntrack-tools/conntrack-tools.mk
index eb7654e..c01501a 100644
--- a/package/conntrack-tools/conntrack-tools.mk
+++ b/package/conntrack-tools/conntrack-tools.mk
@@ -10,7 +10,7 @@ CONNTRACK_TOOLS_SITE = http://www.netfilter.org/projects/conntrack-tools/files
 CONNTRACK_TOOLS_DEPENDENCIES = host-pkgconf \
 	libnetfilter_conntrack libnetfilter_cthelper libnetfilter_cttimeout \
 	libnetfilter_queue host-bison host-flex
-CONNTRACK_TOOLS_LICENSE = GPLv2
+CONNTRACK_TOOLS_LICENSE = GPLv2+
 CONNTRACK_TOOLS_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
