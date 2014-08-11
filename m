From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Aug 2014 22:52:50 +0200
Subject: [Buildroot] [git commit branch/next] package/exim: Bump version to
	4.84
Message-ID: <20140811205327.8B8979D3E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e723b8313f0c283ee5ec7030a6942c57dde100e2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/exim/exim.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 845c5f8..f6016fa 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXIM_VERSION = 4.83
+EXIM_VERSION = 4.84
 EXIM_SOURCE = exim-$(EXIM_VERSION).tar.bz2
 EXIM_SITE = ftp://ftp.exim.org/pub/exim/exim4
 EXIM_LICENSE = GPLv2+
