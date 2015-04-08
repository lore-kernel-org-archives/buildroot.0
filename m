From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  8 Apr 2015 18:57:17 +0200
Subject: [Buildroot] [PATCH 2/8 v4] package/binutils: add hashes
In-Reply-To: <cover.1428512075.git.yann.morin.1998@free.fr>
References: <cover.1428512075.git.yann.morin.1998@free.fr>
Message-ID: <1fedcd0068d180c92addf908097b04c389f05e9a.1428512075.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 package/binutils/binutils.hash | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 package/binutils/binutils.hash

diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
new file mode 100644
index 0000000..4f99514
--- /dev/null
+++ b/package/binutils/binutils.hash
@@ -0,0 +1,7 @@
+# Locally computed:
+sha256 6c7af8ed1c8cf9b4b9d6e6fe09a3e1d3d479fe63984ba8b9b26bf356b6313ca9  binutils-2.22.tar.bz2
+sha256 fe914e56fed7a9ec2eb45274b1f2e14b0d8b4f41906a5194eac6883cfe5c1097  binutils-2.23.2.tar.bz2
+sha256 e5e8c5be9664e7f7f96e0d09919110ab5ad597794f5b1809871177a0f0f14137  binutils-2.24.tar.bz2
+sha256 22defc65cfa3ef2a3395faaea75d6331c6e62ea5dfacfed3e2ec17b08c882923  binutils-2.25.tar.bz2
+# No hash for the ARC variant, comes from the github-helper:
+none   xxx                                                               binutils-arc-2014.12.tar.gz
-- 
1.9.1
