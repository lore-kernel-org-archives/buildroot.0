From: Michael Nosthoff <buildroot@heine.tech>
Date: Mon, 31 May 2021 21:02:54 +0200
Subject: [Buildroot] [PATCH 1/3] package/re2: bump version to 2021-04-01
Message-ID: <20210531190258.4092984-1-buildroot@heine.tech>
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
index a2ed659b64..4182125f5e 100644
--- a/package/re2/re2.hash
+++ b/package/re2/re2.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  1396ab50c06c1a8885fb68bf49a5ecfd989163015fd96699a180d6414937f33f  re2-2021-02-02.tar.gz
+sha256  358aedf71dbf26506848905f5d4417b7adba5cf44d3bbcf70bf4ef68ccb0871e  re2-2021-04-01.tar.gz
 sha256  6040cda75d90b1738292a631d89934c411ef7ffd543c4d6a1b7edfc8edf29449  LICENSE
diff --git a/package/re2/re2.mk b/package/re2/re2.mk
index 028079cb55..806ca24efc 100644
--- a/package/re2/re2.mk
+++ b/package/re2/re2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RE2_VERSION = 2021-02-02
+RE2_VERSION = 2021-04-01
 RE2_SITE = $(call github,google,re2,$(RE2_VERSION))
 RE2_LICENSE = BSD-3-Clause
 RE2_LICENSE_FILES = LICENSE
-- 
2.25.1
