From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 21 Aug 2019 22:44:42 +0200
Subject: [Buildroot] [git commit] package/squid: remove trailing whitespace
Message-ID: <20190821204241.D05A483FED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ac7d6c81f40ac126c8b589fa8ff6a488d0ee972b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 7792c4f1bc introduced trailing whitespace. Remove it.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/276636839

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/squid/squid.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 2e9945faa2..0d09968bd3 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -11,7 +11,7 @@ SQUID_LICENSE = GPL-2.0+
 SQUID_LICENSE_FILES = COPYING
 SQUID_DEPENDENCIES = libcap host-libcap libxml2 host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),libnetfilter_conntrack)
-# We're patching acinclude/os-deps.m4 
+# We're patching acinclude/os-deps.m4
 SQUID_AUTORECONF = YES
 SQUID_CONF_ENV = \
 	ac_cv_epoll_works=yes \
