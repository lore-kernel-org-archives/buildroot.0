From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Feb 2021 14:01:10 +0100
Subject: [Buildroot] [git commit] package/iptables: bump to version 1.8.7
Message-ID: <20210308072135.5C7EA8896D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=49bb8ebd81a295a34511073739f50a235b931a3a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iptables/iptables.hash | 2 +-
 package/iptables/iptables.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iptables/iptables.hash b/package/iptables/iptables.hash
index 120e7e4a89..7f14413931 100644
--- a/package/iptables/iptables.hash
+++ b/package/iptables/iptables.hash
@@ -1,4 +1,4 @@
 # From https://netfilter.org/projects/iptables/downloads.html
-sha256  a0f4fe0c3eb8faa5bd9c8376d132f340b9558e750c91deb2d5028aa3d0047767  iptables-1.8.6.tar.bz2
+sha256  c109c96bb04998cd44156622d36f8e04b140701ec60531a10668cfdff5e8d8f0  iptables-1.8.7.tar.bz2
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index dc01466607..ca8178425e 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPTABLES_VERSION = 1.8.6
+IPTABLES_VERSION = 1.8.7
 IPTABLES_SOURCE = iptables-$(IPTABLES_VERSION).tar.bz2
 IPTABLES_SITE = https://netfilter.org/projects/iptables/files
 IPTABLES_INSTALL_STAGING = YES
