From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Jul 2014 00:02:21 +0200
Subject: [Buildroot] [git commit] nss-mdns: add license information
Message-ID: <20140701224922.2F7D89D12D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=be16ba8edcddc2e317ae86299731d13c45801397
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nss-mdns/nss-mdns.mk |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/nss-mdns/nss-mdns.mk b/package/nss-mdns/nss-mdns.mk
index 30a0a73..ee10085 100644
--- a/package/nss-mdns/nss-mdns.mk
+++ b/package/nss-mdns/nss-mdns.mk
@@ -6,8 +6,9 @@
 
 NSS_MDNS_VERSION = 0.10
 NSS_MDNS_SITE = http://0pointer.de/lennart/projects/nss-mdns
-
-NSS_MDNS_CONF_OPT += --localstatedir=/var
+NSS_MDNS_CONF_OPT = --localstatedir=/var
+NSS_MDNS_LICENSE = LGPLv2.1+
+NSS_MDNS_LICENSE_FILES = LICENSE
 
 define NSS_MDNS_INSTALL_CONFIG
 	sed -r -i -e 's/^(hosts:[[:space:]]+).*/\1files mdns4_minimal [NOTFOUND=return] dns mdns4/' \
