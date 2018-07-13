From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 13 Jul 2018 22:29:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/tor: bump version to 0.3.3.9
Message-ID: <20180713202931.16642-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog:
https://gitweb.torproject.org/tor.git/commit/ChangeLog?h=tor-0.3.3.9&id=5521729da9fc5ca732db4f9ccd2e217f4231e1b6

o Directory authority changes:
  - The "Bifroest" bridge authority has been retired; the new bridge
    authority is "Serge", and it is operated by George from the
    TorBSD project. Closes ticket 26771.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tor/tor.hash | 2 +-
 package/tor/tor.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index d56855f45e..35659eca6e 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 3cf5b4fea2491cbfefa1077bf1b2855e169052d381bd920cd57aa9bfaff6b3a5  tor-0.3.3.8.tar.gz
+sha256 85346b4d026e6a041c8e326d2cc64b5f5361b032075c89c5854f16dbc02fce6f  tor-0.3.3.9.tar.gz
 sha256 f9a4f724d8037711dde7d3f1d17094fb7d211545b3a3bbb1b03e769e13ca5608  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 6f977f8625..2ee25c873f 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.3.3.8
+TOR_VERSION = 0.3.3.9
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
-- 
2.18.0
