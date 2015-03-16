From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Mar 2015 14:47:39 +0100
Subject: [Buildroot] [git commit] network-manager: add upstream hash origin
Message-ID: <20150316134754.ADA78805F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b4927fc5af629eaf155eccf9ba7818769cbe0657
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The commit log in c511ca937d4 (network-manager: add hash file) claimed to fix
hash origin, but didn't actually do so.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/network-manager/network-manager.hash |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
index 07513a9..401108e 100644
--- a/package/network-manager/network-manager.hash
+++ b/package/network-manager/network-manager.hash
@@ -1,2 +1,2 @@
-# Locally computed:
+# From http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/1.0/NetworkManager-1.0.0.sha256sum
 sha256  3a66afec670c975edd9832e620b725a5f16ed267a1b9e1b2d51ef27250d85947  NetworkManager-1.0.0.tar.xz
