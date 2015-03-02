From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Mar 2015 23:47:20 +0100
Subject: [Buildroot] [git commit] wget: bump version to 1.16.2
Message-ID: <20150302224950.9733C7FA36@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cd4cd676b52f1a4a2c9c5ec057342d61d0439e29
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Bump version to 1.16.2
- Update the hash file

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wget/wget.hash |    2 +-
 package/wget/wget.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wget/wget.hash b/package/wget/wget.hash
index f9a274e..dffed4e 100644
--- a/package/wget/wget.hash
+++ b/package/wget/wget.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	2b96c707ee15fe847f5bc2f872a7a530dca803b927a750419b44f50803e14d33  wget-1.16.1.tar.xz
+sha256  a7dfde1bcb0eb135addf587a649fd0e47c1a876edef359b9197cdffd1fdcd7d5  wget-1.16.2.tar.xz
diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index bd8e378..382cdf7 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WGET_VERSION = 1.16.1
+WGET_VERSION = 1.16.2
 WGET_SOURCE = wget-$(WGET_VERSION).tar.xz
 WGET_SITE = $(BR2_GNU_MIRROR)/wget
 WGET_DEPENDENCIES = host-pkgconf
