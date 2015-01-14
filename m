From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Jan 2015 22:16:24 +0100
Subject: [Buildroot] [git commit] package/exim: bump version to 4.85,
	add hash
Message-ID: <20150114211638.0B3C680D95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=469b7765d210cf5f36582811c8f7b8189735a32e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/exim/exim.hash |    2 ++
 package/exim/exim.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/exim/exim.hash b/package/exim/exim.hash
new file mode 100644
index 0000000..e29d9dc
--- /dev/null
+++ b/package/exim/exim.hash
@@ -0,0 +1,2 @@
+# From https://lists.exim.org/lurker/message/20150113.003827.4a5d30e4.en.html
+sha256	13211f2bbc5400d095a9b4be075eb1347e0d98676fdfe4be8a3b4d56281daaa4	exim-4.85.tar.bz2
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index c42c7c1..34a6893 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXIM_VERSION = 4.84
+EXIM_VERSION = 4.85
 EXIM_SOURCE = exim-$(EXIM_VERSION).tar.bz2
 EXIM_SITE = ftp://ftp.exim.org/pub/exim/exim4
 EXIM_LICENSE = GPLv2+
