From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 7 Jul 2020 22:32:24 +0200
Subject: [Buildroot] [git commit] package/libevent: bump to version 2.1.12
Message-ID: <20200707202931.1181186586@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b572e1478fad494e5854cab2d1497a0b208677eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See full changelog https://raw.githubusercontent.com/libevent/libevent/release-2.1.12-stable/ChangeLog

And update hash file formatting (2 spaces).

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
[yann.morin.1998 at free.fr: drop md5, add sha256]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libevent/libevent.hash | 6 +++---
 package/libevent/libevent.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libevent/libevent.hash b/package/libevent/libevent.hash
index 7bcb381dd3..77574e784b 100644
--- a/package/libevent/libevent.hash
+++ b/package/libevent/libevent.hash
@@ -1,4 +1,4 @@
 # locally computed
-md5	7f35cfe69b82d879111ec0d7b7b1c531	libevent-2.1.11-stable.tar.gz
-sha1	a76bba0a281da9384d4be5b40f3907c07e21428c	libevent-2.1.11-stable.tar.gz
-sha256	ff02effc9b331edcdac387d198691bfa3e575e7d244ad10cb826aa51ef085670	LICENSE
+sha1  cd55656a9b5bed630b08f05495230affb7996b21  libevent-2.1.12-stable.tar.gz
+sha256  92e6de1be9ec176428fd2367677e61ceffc2ee1cb119035037a27d346b0403bb  libevent-2.1.12-stable.tar.gz
+sha256  ff02effc9b331edcdac387d198691bfa3e575e7d244ad10cb826aa51ef085670  LICENSE
diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
index d604559313..5d02191a58 100644
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
