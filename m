From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Aug 2014 21:33:42 +0200
Subject: [Buildroot] [git commit branch/next] nmap: bump to version 6.47
Message-ID: <20140827193418.47BC59D55F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=800ebf340ca79ee6b90eb510ee459b26e0cad91b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nmap/nmap.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index 40e381a..3ba6f1a 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NMAP_VERSION = 6.46
+NMAP_VERSION = 6.47
 NMAP_SITE = http://nmap.org/dist
 NMAP_SOURCE = nmap-$(NMAP_VERSION).tar.bz2
 NMAP_DEPENDENCIES = libpcap pcre
