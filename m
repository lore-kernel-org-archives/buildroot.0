From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Dec 2014 18:48:14 +0100
Subject: [Buildroot] [git commit] wget: bump version to 1.16.1
Message-ID: <20141208174845.1300880149@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cc6d880ca440c2928125b80ac0556693469f1652
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Bump version to 1.16.1
- Update hash file

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wget/wget.hash |    2 +-
 package/wget/wget.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wget/wget.hash b/package/wget/wget.hash
index 8ef92bf..f9a274e 100644
--- a/package/wget/wget.hash
+++ b/package/wget/wget.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	9261dd090a17687b6dc0682a257e90a926def15624b650e8f799af57e5c8b0e7	wget-1.16.tar.xz
+sha256	2b96c707ee15fe847f5bc2f872a7a530dca803b927a750419b44f50803e14d33  wget-1.16.1.tar.xz
diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index e50981e..b19c987 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WGET_VERSION = 1.16
+WGET_VERSION = 1.16.1
 WGET_SOURCE = wget-$(WGET_VERSION).tar.xz
 WGET_SITE = $(BR2_GNU_MIRROR)/wget
 WGET_LICENSE = GPLv3+
