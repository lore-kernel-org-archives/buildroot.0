From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  6 Nov 2014 10:36:48 -0300
Subject: [Buildroot] [PATCH 2/7] package/uclibc: enable wordexp
In-Reply-To: <1415281013-1077-1-git-send-email-gustavo@zacarias.com.ar>
References: <1415281013-1077-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1415281013-1077-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's required by Debian ifupdown.
+13 KB for ARM.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/uclibc/uClibc-0.9.31.config   | 2 +-
 package/uclibc/uClibc-0.9.33.config   | 2 +-
 package/uclibc/uClibc-snapshot.config | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/uclibc/uClibc-0.9.31.config b/package/uclibc/uClibc-0.9.31.config
index 76772e8..12db6b2 100644
--- a/package/uclibc/uClibc-0.9.31.config
+++ b/package/uclibc/uClibc-0.9.31.config
@@ -190,7 +190,7 @@ UCLIBC_HAS_REGEX=y
 # UCLIBC_HAS_REGEX_OLD is not set
 UCLIBC_HAS_FNMATCH=y
 # UCLIBC_HAS_FNMATCH_OLD is not set
-# UCLIBC_HAS_WORDEXP is not set
+UCLIBC_HAS_WORDEXP=y
 UCLIBC_HAS_NFTW=y
 UCLIBC_HAS_FTW=y
 UCLIBC_HAS_GLOB=y
diff --git a/package/uclibc/uClibc-0.9.33.config b/package/uclibc/uClibc-0.9.33.config
index 1b07d4a..9db13d1 100644
--- a/package/uclibc/uClibc-0.9.33.config
+++ b/package/uclibc/uClibc-0.9.33.config
@@ -226,7 +226,7 @@ UCLIBC_HAS_REGEX=y
 # UCLIBC_HAS_REGEX_OLD is not set
 UCLIBC_HAS_FNMATCH=y
 # UCLIBC_HAS_FNMATCH_OLD is not set
-# UCLIBC_HAS_WORDEXP is not set
+UCLIBC_HAS_WORDEXP=y
 UCLIBC_HAS_NFTW=y
 UCLIBC_HAS_FTW=y
 # UCLIBC_HAS_FTS is not set
diff --git a/package/uclibc/uClibc-snapshot.config b/package/uclibc/uClibc-snapshot.config
index ffc1535..e38bdc3 100644
--- a/package/uclibc/uClibc-snapshot.config
+++ b/package/uclibc/uClibc-snapshot.config
@@ -231,7 +231,7 @@ UCLIBC_HAS_REGEX=y
 # UCLIBC_HAS_REGEX_OLD is not set
 UCLIBC_HAS_FNMATCH=y
 # UCLIBC_HAS_FNMATCH_OLD is not set
-# UCLIBC_HAS_WORDEXP is not set
+UCLIBC_HAS_WORDEXP=y
 UCLIBC_HAS_NFTW=y
 UCLIBC_HAS_FTW=y
 # UCLIBC_HAS_FTS is not set
-- 
2.0.4
