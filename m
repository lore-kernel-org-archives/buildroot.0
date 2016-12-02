From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Dec 2016 23:59:48 +0100
Subject: [Buildroot] [git commit] package/tinc: upgrade to upstream version
	1.0.30
Message-ID: <20161202230001.52E0381D5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a9f458e6a0dfcd5c9519384516a5a84381361ff7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tinc/tinc.hash | 2 +-
 package/tinc/tinc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tinc/tinc.hash b/package/tinc/tinc.hash
index 0cccbbf..135a4f3 100644
--- a/package/tinc/tinc.hash
+++ b/package/tinc/tinc.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	0b502699360f09ce2128a39cf02abca07bfc699fc02ce829b3a90cf5e1e8b344	tinc-1.0.28.tar.gz
+sha256	abc17e25afc1b9e74423c78fef586b11d503cbbbe5e4a2ed323870f4a82faa73 tinc-1.0.30.tar.gz
diff --git a/package/tinc/tinc.mk b/package/tinc/tinc.mk
index fb15c34..6d87cbf 100644
--- a/package/tinc/tinc.mk
+++ b/package/tinc/tinc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TINC_VERSION = 1.0.28
+TINC_VERSION = 1.0.30
 TINC_SITE = http://www.tinc-vpn.org/packages
 TINC_DEPENDENCIES = lzo openssl zlib
 TINC_LICENSE = GPLv2+ with OpenSSL exception
