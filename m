From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 9 Aug 2014 10:15:51 +0200
Subject: [Buildroot] [git commit branch/next] nanocom: change version to 1.0
Message-ID: <20140809081639.05D229D3FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8aafe1dfb9d1d6753f53661afa3c47fdace8417c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

As that is really what it is.

[Peter: slightly reworded description]
Signed-off-by: Sergey Alyoshin <alyoshin.s@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nanocom/nanocom.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nanocom/nanocom.mk b/package/nanocom/nanocom.mk
index c2a9291..f723951 100644
--- a/package/nanocom/nanocom.mk
+++ b/package/nanocom/nanocom.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-NANOCOM_VERSION = 2.6.1
+NANOCOM_VERSION = 1.0
 NANOCOM_SOURCE = nanocom.tar.gz
-NANOCOM_SITE = http://downloads.sourceforge.net/project/nanocom/nanocom/v1.0
+NANOCOM_SITE = http://downloads.sourceforge.net/project/nanocom/nanocom/v$(NANOCOM_VERSION)
 NANOCOM_LICENSE = GPLv2+
 NANOCOM_LICENSE_FILES = COPYING
 
