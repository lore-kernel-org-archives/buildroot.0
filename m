From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 23 Feb 2019 08:50:29 +0100
Subject: [Buildroot] [PATCH 1/1] package/tor: security bump to 0.3.5.8
Message-ID: <20190223075029.1838-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://blog.torproject.org/new-releases-tor-0402-alpha-0358-03411-and-03312

Fixes CVE-2019-8955:
KIST can write above outbuf highwater mark
https://trac.torproject.org/projects/tor/ticket/29168

Updated license hash after upstream commit
https://gitweb.torproject.org/tor.git/commit/LICENSE?h=maint-0.3.5&id=efe55b88987c2539c218fdf1f46f16f9bdc3a8eb
which bumps copyright date to 2019.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index a3a285fb04..5b07981d95 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 1b0887fc21ac535befea7243c5d5f1e31394d7458d64b30807a3e98cca0d839e  tor-0.3.5.7.tar.gz
-sha256 db6ec24b24dfb2423ce75be99dec3acd35a27d050a9d7d708026b049fb8d3731  LICENSE
+sha256 d5c56603942a8927670f50a4a469fb909e29d3571fdd013389d567e57abc0b47  tor-0.3.5.8.tar.gz
+sha256 b4248f32f009d4f5cccb704b351e31a16590e0dd5fda2856382cc854d81f6234  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 98ab246171..f7e90a760b 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.3.5.7
+TOR_VERSION = 0.3.5.8
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
-- 
2.20.1
