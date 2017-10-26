From: Martin Bark <martin@barkynet.com>
Date: Thu, 26 Oct 2017 11:18:48 +0100
Subject: [Buildroot] [PATCH 2/2] package/tzdata: bump version to 2017c
In-Reply-To: <1509013128-30527-1-git-send-email-martin@barkynet.com>
References: <1509013128-30527-1-git-send-email-martin@barkynet.com>
Message-ID: <1509013128-30527-2-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/tzdata/tzdata.hash | 4 ++--
 package/tzdata/tzdata.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tzdata/tzdata.hash b/package/tzdata/tzdata.hash
index b8a5cf2..277acd6 100644
--- a/package/tzdata/tzdata.hash
+++ b/package/tzdata/tzdata.hash
@@ -1,2 +1,2 @@
-# From http://mm.icann.org/pipermail/tz-announce/2017-March/000046.html
-sha512 3e090dba1f52e4c63b4930b28f4bf38b56aabd6728f23094cb5801d10f4e464f17231f17b75b8866714bf98199c166ea840de0787b75b2274aa419a4e14bbc4d	tzdata2017b.tar.gz
+# From http://mm.icann.org/pipermail/tz-announce/2017-October/000047.html
+sha512 feb5c544e617b30c73a397e5a1c51f9847d0fddf1dfa0f9ace2e6f686786f09b666937b2048e07075c84593fc584bd5a25d639fce70eca9735267df28621ab4c	tzdata2017c.tar.gz
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index 3b7f5c1..9bb4b4f 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TZDATA_VERSION = 2017b
+TZDATA_VERSION = 2017c
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
 TZDATA_SITE = http://www.iana.org/time-zones/repository/releases
 TZDATA_STRIP_COMPONENTS = 0
-- 
2.7.4
