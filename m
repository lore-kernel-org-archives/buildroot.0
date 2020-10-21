From: Michael Nosthoff <buildroot@heine.tech>
Date: Wed, 21 Oct 2020 18:50:02 +0200
Subject: [Buildroot] [PATCH v2 2/4] package/re2: bump version to 2020-10-01
In-Reply-To: <20201021165005.641-1-buildroot@heine.tech>
References: <20201021165005.641-1-buildroot@heine.tech>
Message-ID: <20201021165005.641-2-buildroot@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

---

Resend as first mail got lost somehow.

---
 package/re2/re2.hash | 2 +-
 package/re2/re2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/re2/re2.hash b/package/re2/re2.hash
index b8a80513b7..b502f12835 100644
--- a/package/re2/re2.hash
+++ b/package/re2/re2.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  6f4c8514249cd65b9e85d3e6f4c35595809a63ad71c5d93083e4d1dcdf9e0cd6  re2-2020-08-01.tar.gz
+sha256  0915741f524ad87debb9eb0429fe6016772a1569e21dc6d492039562308fcb0f  re2-2020-10-01.tar.gz
 sha256  6040cda75d90b1738292a631d89934c411ef7ffd543c4d6a1b7edfc8edf29449  LICENSE
diff --git a/package/re2/re2.mk b/package/re2/re2.mk
index 0c3bf4e844..7d1857dbf9 100644
--- a/package/re2/re2.mk
+++ b/package/re2/re2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RE2_VERSION = 2020-08-01
+RE2_VERSION = 2020-10-01
 RE2_SITE = $(call github,google,re2,$(RE2_VERSION))
 RE2_LICENSE = BSD-3-Clause
 RE2_LICENSE_FILES = LICENSE
-- 
2.25.1
