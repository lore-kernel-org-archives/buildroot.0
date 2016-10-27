From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Oct 2016 21:53:01 +0200
Subject: [Buildroot] [git commit] lft: bump to version 3.77
Message-ID: <20161027195405.3672980765@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=21db6fe246016266ba033c6b802aeb35944f613b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lft/lft.hash | 2 +-
 package/lft/lft.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lft/lft.hash b/package/lft/lft.hash
index 714b7bd..b045e7c 100644
--- a/package/lft/lft.hash
+++ b/package/lft/lft.hash
@@ -1,2 +1,2 @@
 # Locally calculated, matches download from fossies.org and pwhois.org
-sha256	fa163f8eaa9c27e12ecf533e79d8606895a301d2a75b9a77f0df29ef9a20c561	lft-3.76.tar.gz
+sha256	d182d6774e64dcdeb19ed1a598fa588e57ddb6cbb6847d9277c405d3a4597d89	lft-3.77.tar.gz
diff --git a/package/lft/lft.mk b/package/lft/lft.mk
index d2b82b2..72f43fa 100644
--- a/package/lft/lft.mk
+++ b/package/lft/lft.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LFT_VERSION = 3.76
+LFT_VERSION = 3.77
 LFT_SITE = http://pwhois.org/get
 LFT_DEPENDENCIES = libpcap
 LFT_LICENSE = VOSTROM Public License for Open Source
