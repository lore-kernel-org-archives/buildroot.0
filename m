From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Nov 2014 23:21:41 +0100
Subject: [Buildroot] [git commit branch/next] dhcpcd: bump to version 6.6.2
Message-ID: <20141119222240.845947F8B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3cd5b136c51e7ecddbce50dbe2ac8bc84d948d73
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dhcpcd/dhcpcd.hash |    2 ++
 package/dhcpcd/dhcpcd.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/dhcpcd/dhcpcd.hash b/package/dhcpcd/dhcpcd.hash
new file mode 100644
index 0000000..c8ae064
--- /dev/null
+++ b/package/dhcpcd/dhcpcd.hash
@@ -0,0 +1,2 @@
+# Locally calculated from download (no sig, hash)
+sha256	879c81febafc95ed9353909b719af765e9925c6cb06226b79da6c0dd176fe89f	dhcpcd-6.6.2.tar.bz2
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index 9757421..c06002f 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DHCPCD_VERSION = 6.4.7
+DHCPCD_VERSION = 6.6.2
 DHCPCD_SOURCE = dhcpcd-$(DHCPCD_VERSION).tar.bz2
 DHCPCD_SITE = http://roy.marples.name/downloads/dhcpcd
 DHCPCD_DEPENDENCIES = host-pkgconf
