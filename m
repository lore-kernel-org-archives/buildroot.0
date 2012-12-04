From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 4 Dec 2012 13:56:00 -0800
Subject: [Buildroot] [git commit] argus: add license information
Message-ID: <20121204215925.B425E903AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=329ffe5a60d35f45087fe4aacad6e9026740617f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/argus/argus.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/argus/argus.mk b/package/argus/argus.mk
index da7ecac..a4b5330 100644
--- a/package/argus/argus.mk
+++ b/package/argus/argus.mk
@@ -8,6 +8,8 @@ ARGUS_SOURCE:=argus_$(ARGUS_VERSION).orig.tar.gz
 ARGUS_PATCH:=argus_$(ARGUS_VERSION)-1.diff.gz
 ARGUS_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/a/argus/
 ARGUS_DEPENDENCIES=libpcap
+ARGUS_LICENSE = GPLv2+
+ARGUS_LICENSE_FILES = COPYING
 
 define ARGUS_DEBIAN_PATCH_APPLY
 	if [ -d $(@D)/debian/patches ]; then \
