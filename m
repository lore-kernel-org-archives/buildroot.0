From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Apr 2015 23:25:22 +0200
Subject: [Buildroot] [git commit] package/thrift: reorders alphabetically
	the dependencies.
Message-ID: <20150406212527.EC629819BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=18c8efe90baec4f4e11068b08d322de3e233e2e9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/thrift/thrift.mk |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/thrift/thrift.mk b/package/thrift/thrift.mk
index 094f8d0..409b04d 100644
--- a/package/thrift/thrift.mk
+++ b/package/thrift/thrift.mk
@@ -8,8 +8,9 @@ THRIFT_VERSION = 0.9.2
 THRIFT_SITE = http://www.us.apache.org/dist/thrift/$(THRIFT_VERSION)
 THRIFT_DEPENDENCIES = host-pkgconf host-thrift boost libevent openssl zlib
 THRIFT_INSTALL_STAGING = YES
-HOST_THRIFT_DEPENDENCIES = host-boost host-libevent host-openssl host-pkgconf \
-	host-zlib host-bison host-flex
+HOST_THRIFT_DEPENDENCIES = host-bison host-boost host-flex host-libevent \
+	host-openssl host-pkgconf host-zlib
+
 THRIFT_CONF_OPTS = --with-sysroot=$(STAGING_DIR) \
 	--with-boost \
 	--with-boost-libdir=$(STAGING_DIR)/usr/lib \
