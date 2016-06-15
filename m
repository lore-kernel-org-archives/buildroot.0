From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Jun 2016 15:28:29 -0300
Subject: [Buildroot] [PATCH 2/2] tzdata: bump to version 2016e
In-Reply-To: <1466015309-1958-1-git-send-email-gustavo@zacarias.com.ar>
References: <1466015309-1958-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1466015309-1958-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/tzdata/tzdata.hash | 4 ++--
 package/tzdata/tzdata.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tzdata/tzdata.hash b/package/tzdata/tzdata.hash
index 1529fd4..9f1859e 100644
--- a/package/tzdata/tzdata.hash
+++ b/package/tzdata/tzdata.hash
@@ -1,2 +1,2 @@
-# From: http://mm.icann.org/pipermail/tz-announce/2016-April/000038.html
-sha512  f1beb1793c4c7d18f2dadaf4a928b1476f66b400bda0c87b06155c0dd1c4b4a26bb2f37dc17a3676a2bbe9c1e71a5d8b27a171c797a86464b0bc0d13abfb2f99  tzdata2016d.tar.gz
+# From http://mm.icann.org/pipermail/tz-announce/2016-June/000039.html
+sha512	dace0f6fc87a73879ca3a1b143d7dcf9c50803e23e6b8c91f83711704e28129af776676c547c42f14dee7f1e8e285ce25296e53a52d11f4c8f155b5f80f4beb3 	tzdata2016e.tar.gz
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index f50a83c..17da3a1 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TZDATA_VERSION = 2016d
+TZDATA_VERSION = 2016e
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
 TZDATA_SITE = http://www.iana.org/time-zones/repository/releases
 TZDATA_STRIP_COMPONENTS = 0
-- 
2.7.3
