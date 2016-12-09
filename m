From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 9 Dec 2016 18:12:01 +0100
Subject: [Buildroot] [git commit] grep: bump to version 2.27
Message-ID: <20161209171846.55F7780102@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eaf99d7de2ba62dd0edb43ec34d9b5407b0abe6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/grep/grep.hash | 2 +-
 package/grep/grep.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/grep/grep.hash b/package/grep/grep.hash
index 789ceea..326737a 100644
--- a/package/grep/grep.hash
+++ b/package/grep/grep.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking signature
-sha256 246a8fb37e82aa33d495b07c22fdab994c039ab0f818538eac81b01e78636870  grep-2.26.tar.xz
+sha256 ad4cc44d23074a1c3a8baae8fbafff2a8c60f38a9a6108f985eef6fbee6dcaeb  grep-2.27.tar.xz
diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index a8e124e..7615f30 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GREP_VERSION = 2.26
+GREP_VERSION = 2.27
 GREP_SITE = $(BR2_GNU_MIRROR)/grep
 GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
 GREP_LICENSE = GPLv3+
