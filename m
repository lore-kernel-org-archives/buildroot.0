From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Oct 2015 22:03:13 +0200
Subject: [Buildroot] [git commit] minicom: switch to the official site
Message-ID: <20151021200922.081B881EF0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6adacbe61a110daa741438a91961cf2675683f95
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We switched to our mirror because because the official site started to
fail, but now it works again.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/minicom/minicom.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/minicom/minicom.mk b/package/minicom/minicom.mk
index dd05741..26e9cef 100644
--- a/package/minicom/minicom.mk
+++ b/package/minicom/minicom.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MINICOM_VERSION = 2.7
-MINICOM_SITE = http://sources.buildroot.net
+MINICOM_SITE = https://alioth.debian.org/frs/download.php/file/3977
 MINICOM_LICENSE = GPLv2+
 MINICOM_LICENSE_FILES = COPYING
 
