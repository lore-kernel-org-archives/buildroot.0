From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 10 Oct 2020 21:46:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/jansson: bump to version 2.13.1
Message-ID: <20201010194629.1434731-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Update hash of LICENSE file (update in year:
  https://github.com/akheron/jansson/commit/2882ead5bb90cf12a01b07b2c2361e24960fae02)
- Update indentation in hash file (two spaces)

https://jansson.readthedocs.io/en/2.13/changes.html#version-2-13-1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/jansson/jansson.hash | 4 ++--
 package/jansson/jansson.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/jansson/jansson.hash b/package/jansson/jansson.hash
index 5baec1968d..5c19316981 100644
--- a/package/jansson/jansson.hash
+++ b/package/jansson/jansson.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256	5f8dec765048efac5d919aded51b26a32a05397ea207aa769ff6b53c7027d2c9	jansson-2.12.tar.gz
-sha256	f0a0c95c64e9f49ec4cbfac8e7fee06823c85ee8ba4af5d57aaabb372347adc2	LICENSE
+sha256  f4f377da17b10201a60c1108613e78ee15df6b12016b116b6de42209f47a474f  jansson-2.13.1.tar.gz
+sha256  1fff7d37d22157bcd81ab53b6c54da755d7c2f868f15807d9bde920f10730da0  LICENSE
diff --git a/package/jansson/jansson.mk b/package/jansson/jansson.mk
index b53381d465..83fb370160 100644
--- a/package/jansson/jansson.mk
+++ b/package/jansson/jansson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JANSSON_VERSION = 2.12
+JANSSON_VERSION = 2.13.1
 JANSSON_SITE = http://www.digip.org/jansson/releases
 JANSSON_LICENSE = MIT
 JANSSON_LICENSE_FILES = LICENSE
-- 
2.28.0
