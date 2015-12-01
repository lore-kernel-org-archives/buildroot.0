From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 01 Dec 2015 23:21:15 -0000
Subject: [Buildroot] [git commit] package/tvheadend: bump version
Message-ID: <20151201232114.5AC43821F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=334bae4bd85f20cee927c05a70dfa08aab2453b9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tvheadend/tvheadend.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 4ffb357..6b8fdea 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = 1b682a46a11ea821c4ed183a274bc78993ef40a0
+TVHEADEND_VERSION = a27b0af2b82dae83cf8a41e01ee1174b911f3aa3
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPLv3+
 TVHEADEND_LICENSE_FILES = LICENSE.md
