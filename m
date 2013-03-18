From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 18 Mar 2013 09:45:43 +0100
Subject: [Buildroot] [git commit] urg: fix license
Message-ID: <20130318084643.C36B39B135@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ffa779564e6367a2133f0a3e7bd5bd070287dbbb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The urg.mk file mentions a LGPLv3+ license. However, none of the
source code in the urg package carries a copyright notice that
indicates the "v3 or later". The only license information we have is
the COPYING file, that contains the text of the LGPLv3
license. Therefore, we should probably assume that the code is under
LGPLv3 only.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/urg/urg.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/urg/urg.mk b/package/urg/urg.mk
index 3f68bf2..b544ece 100644
--- a/package/urg/urg.mk
+++ b/package/urg/urg.mk
@@ -7,7 +7,7 @@
 URG_VERSION = 0.8.18
 URG_SITE = http://www.hokuyo-aut.jp/02sensor/07scanner/download/urg_programs_en/
 URG_SOURCE = urg-$(URG_VERSION).zip
-URG_LICENSE = LGPLv3+
+URG_LICENSE = LGPLv3
 URG_LICENSE_FILES = COPYING
 
 URG_INSTALL_STAGING = YES
