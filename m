From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 21 Dec 2011 10:12:17 +0100
Subject: [Buildroot] [git commit] lighttpd: bump version, security fix
Message-ID: <20111221091325.D15E88FB0D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7f4a2bbcf397fb843a8abac78901a692fa576c5f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Important changes:

- [mod_auth] Fix signedness error in http_auth (CVE-2011-4362)
- ssl: disable client initiated renegotiations
- ssl: support mitigating BEAST attack
- fix connection stalls

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lighttpd/lighttpd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 3f11be3..b8aa310 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIGHTTPD_VERSION = 1.4.29
+LIGHTTPD_VERSION = 1.4.30
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-1.4.x
 LIGHTTPD_DEPENDENCIES = host-pkg-config
 LIGHTTPD_CONF_OPT = \
