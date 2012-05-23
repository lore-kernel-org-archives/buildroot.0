From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 23 May 2012 22:25:54 +0200
Subject: [Buildroot] [git commit branch/next] libnetfilter-conntrack: bump
	to version 1.0.1
Message-ID: <20120523202635.6B12A96D8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cf54176bd1dd1c90a9be0ee18fac3accd4c6f186
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../libnetfilter-conntrack.mk                      |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libnetfilter_conntrack/libnetfilter-conntrack.mk b/package/libnetfilter_conntrack/libnetfilter-conntrack.mk
index 66f0f69..3313e23 100644
--- a/package/libnetfilter_conntrack/libnetfilter-conntrack.mk
+++ b/package/libnetfilter_conntrack/libnetfilter-conntrack.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBNETFILTER_CONNTRACK_VERSION = 1.0.0
+LIBNETFILTER_CONNTRACK_VERSION = 1.0.1
 LIBNETFILTER_CONNTRACK_SOURCE = libnetfilter_conntrack-$(LIBNETFILTER_CONNTRACK_VERSION).tar.bz2
 LIBNETFILTER_CONNTRACK_SITE = http://www.netfilter.org/projects/libnetfilter_conntrack/files
 LIBNETFILTER_CONNTRACK_INSTALL_STAGING = YES
