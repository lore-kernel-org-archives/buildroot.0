From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Oct 2020 17:27:29 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/angularjs:
 security bump version to 1.8.0
Message-ID: <20201029161802.74236835D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=11f1178c14ecf6f9accc646ec6b50b6a7a3c86ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes the following security issue:

- CVE-2020-11022: Potential XSS vulnerability in jQuery
  https://github.com/advisories/GHSA-gxr4-xjj5-5px2

Signed-off-by: Ignacy Gaw??dzki <ignacy.gawedzki@green-communications.fr>
[yann.morin.1998 at free.fr: two spaces in hash file]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 4fc87ffb5011444dc8dfac59c782884e5e61122b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/angularjs/angularjs.hash | 4 ++--
 package/angularjs/angularjs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/angularjs/angularjs.hash b/package/angularjs/angularjs.hash
index 4f0f36b2a1..7df9ae8596 100644
--- a/package/angularjs/angularjs.hash
+++ b/package/angularjs/angularjs.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	7182e7f39b921469157971d9e0783745758df4b625322d606ec7d9abf2b28af2	angular-1.7.9.zip
-sha256	2420c59374dcdc1ca9721c334a32afee92f0610280cae0d1b3952b1279bc2b24	angular.js
+sha256  c4098f594dc24cc4c8ad469c6d5785a65c0df812afe9f56ea0e4d3490c2fd46d  angular-1.8.0.zip
+sha256  c7df41bc00628bec220b0378dc1f2f5041980758403b6f24b9774ac43a9186d8  angular.js
diff --git a/package/angularjs/angularjs.mk b/package/angularjs/angularjs.mk
index 295be5400a..53b837e59f 100644
--- a/package/angularjs/angularjs.mk
+++ b/package/angularjs/angularjs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ANGULARJS_VERSION = 1.7.9
+ANGULARJS_VERSION = 1.8.0
 ANGULARJS_SOURCE = angular-$(ANGULARJS_VERSION).zip
 ANGULARJS_SITE = https://code.angularjs.org/$(ANGULARJS_VERSION)
 ANGULARJS_LICENSE = MIT
