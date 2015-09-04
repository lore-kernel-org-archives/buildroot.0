From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Sep 2015 11:56:49 +0200
Subject: [Buildroot] [git commit] openswan: security bump to version 2.6.45
Message-ID: <20150904100014.088B57FB60@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=37187c38db30485afe80309dc9b57609cfdcf17f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2015-3240 - IKE DoS when using NSS.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openswan/openswan.hash |    2 +-
 package/openswan/openswan.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openswan/openswan.hash b/package/openswan/openswan.hash
index 4853b3f..ef4e18b 100644
--- a/package/openswan/openswan.hash
+++ b/package/openswan/openswan.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	ac7ef1d78766801f23c458cc7c3b080ca6e20c5144a1979598c319bc3bc7c88b	openswan-2.6.43.tar.gz
+sha256	b657b4a3828fc6e9830aabeabec047a71993daeb9dd2607f321e355bc5a53e1e	openswan-2.6.45.tar.gz
diff --git a/package/openswan/openswan.mk b/package/openswan/openswan.mk
index b7689c1..7fa945f 100644
--- a/package/openswan/openswan.mk
+++ b/package/openswan/openswan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSWAN_VERSION = 2.6.43
+OPENSWAN_VERSION = 2.6.45
 OPENSWAN_SITE = http://download.openswan.org/openswan
 OPENSWAN_LICENSE = GPLv2+, BSD-3c
 OPENSWAN_LICENSE_FILES = COPYING LICENSE
