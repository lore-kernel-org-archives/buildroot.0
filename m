From: Michael Nosthoff <buildroot@heine.tech>
Date: Mon, 15 Mar 2021 16:04:24 +0100
Subject: [Buildroot] [PATCH] package/re2: bump to version 2021-02-02
Message-ID: <20210315150424.1103500-1-buildroot@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/re2/re2.hash | 2 +-
 package/re2/re2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/re2/re2.hash b/package/re2/re2.hash
index b5457a59b1..a2ed659b64 100644
--- a/package/re2/re2.hash
+++ b/package/re2/re2.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  8903cc66c9d34c72e2bc91722288ebc7e3ec37787ecfef44d204b2d6281954d7  re2-2020-11-01.tar.gz
+sha256  1396ab50c06c1a8885fb68bf49a5ecfd989163015fd96699a180d6414937f33f  re2-2021-02-02.tar.gz
 sha256  6040cda75d90b1738292a631d89934c411ef7ffd543c4d6a1b7edfc8edf29449  LICENSE
diff --git a/package/re2/re2.mk b/package/re2/re2.mk
index 585846d570..028079cb55 100644
--- a/package/re2/re2.mk
+++ b/package/re2/re2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RE2_VERSION = 2020-11-01
+RE2_VERSION = 2021-02-02
 RE2_SITE = $(call github,google,re2,$(RE2_VERSION))
 RE2_LICENSE = BSD-3-Clause
 RE2_LICENSE_FILES = LICENSE
-- 
2.25.1
