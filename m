From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Oct 2014 12:07:27 +0200
Subject: [Buildroot] [git commit] whois: bump to version 5.2.0
Message-ID: <20141007101107.106C3B76BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=464faa5f401fab69cfecdfd28854c1f19a610237
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/whois/whois.hash |    2 ++
 package/whois/whois.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/whois/whois.hash b/package/whois/whois.hash
new file mode 100644
index 0000000..368beea
--- /dev/null
+++ b/package/whois/whois.hash
@@ -0,0 +1,2 @@
+# From http://ftp.debian.org/debian/pool/main/w/whois/whois_5.2.0.dsc
+sha256	f487bba00fc506b18b519d913509d9e050cba0b6f025e26a50b29b3e6322530b	whois_5.2.0.tar.xz
diff --git a/package/whois/whois.mk b/package/whois/whois.mk
index 3dbf338..a9f74d1 100644
--- a/package/whois/whois.mk
+++ b/package/whois/whois.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WHOIS_VERSION = 5.1.3
+WHOIS_VERSION = 5.2.0
 WHOIS_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/w/whois
 WHOIS_SOURCE = whois_$(WHOIS_VERSION).tar.xz
 # take precedence over busybox implementation
