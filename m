From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Jan 2018 12:14:57 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] squid: bump version to
 3.5.26
Message-ID: <20180131123645.1BD2F88170@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5ce5653e4882321b087b629f152470cb850ba926
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit fffced338da664e714b102774355e032e0297010)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/squid/squid.hash | 6 +++---
 package/squid/squid.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index 95762bc8bd..91ba9e6fc4 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,3 +1,3 @@
-# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.25.tar.xz.asc
-md5 6b7dd7b42b1adacf08f3155640ea2782  squid-3.5.25.tar.xz
-sha1 63ea00cb918e3106fd91b286ec907f1681e0f0e8  squid-3.5.25.tar.xz
+# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.26.tar.xz.asc
+md5 510e2c84773879c00d0e7ced997864d9  squid-3.5.26.tar.xz
+sha1 51a664217957b35de8b7fae180b9f93a759a4204  squid-3.5.26.tar.xz
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 09d9bca139..7379750894 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SQUID_VERSION_MAJOR = 3.5
-SQUID_VERSION = $(SQUID_VERSION_MAJOR).25
+SQUID_VERSION = $(SQUID_VERSION_MAJOR).26
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/$(SQUID_VERSION_MAJOR)
 SQUID_LICENSE = GPLv2+
