From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Mon,  6 Jul 2020 20:29:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/libevent: bump to version 2.1.12
Message-ID: <1594060185-11707-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See full changelog https://raw.githubusercontent.com/libevent/libevent/release-2.1.12-stable/ChangeLog

And update hash file formatting (2 spaces).

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/libevent/libevent.hash | 6 +++---
 package/libevent/libevent.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libevent/libevent.hash b/package/libevent/libevent.hash
index 7bcb381..e752d75 100644
--- a/package/libevent/libevent.hash
+++ b/package/libevent/libevent.hash
@@ -1,4 +1,4 @@
 # locally computed
-md5	7f35cfe69b82d879111ec0d7b7b1c531	libevent-2.1.11-stable.tar.gz
-sha1	a76bba0a281da9384d4be5b40f3907c07e21428c	libevent-2.1.11-stable.tar.gz
-sha256	ff02effc9b331edcdac387d198691bfa3e575e7d244ad10cb826aa51ef085670	LICENSE
+md5  b5333f021f880fe76490d8a799cd79f4  libevent-2.1.12-stable.tar.gz
+sha1  cd55656a9b5bed630b08f05495230affb7996b21  libevent-2.1.12-stable.tar.gz
+sha256  ff02effc9b331edcdac387d198691bfa3e575e7d244ad10cb826aa51ef085670  LICENSE
diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
index d604559..5d02191 100644
--- a/package/libevent/libevent.mk
+++ b/package/libevent/libevent.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEVENT_VERSION = 2.1.11
+LIBEVENT_VERSION = 2.1.12
 LIBEVENT_SITE = https://github.com/libevent/libevent/releases/download/release-$(LIBEVENT_VERSION)-stable
 LIBEVENT_SOURCE = libevent-$(LIBEVENT_VERSION)-stable.tar.gz
 LIBEVENT_INSTALL_STAGING = YES
-- 
2.7.4
