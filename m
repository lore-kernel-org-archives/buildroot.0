From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  4 Mar 2021 12:42:02 +0100
Subject: [Buildroot] [PATCH 1/1] package/libstrophe: fix tarball hash
Message-ID: <20210304114202.1237328-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix hash added by commit 28c7ff0bdb602e75d2891818ff87fe7fd4ed0015:
https://patchwork.ozlabs.org/project/buildroot/patch/20210104101054.5392-1-jubalh at iodoru.org

While at it, also update indentation in hash file (two spaces)

Fixes:
 - http://autobuild.buildroot.org/results/2f13af96eee20176ccb37ad32ec1472b4c9d6208

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libstrophe/libstrophe.hash | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libstrophe/libstrophe.hash b/package/libstrophe/libstrophe.hash
index 6aca289fb5..d5f151660f 100644
--- a/package/libstrophe/libstrophe.hash
+++ b/package/libstrophe/libstrophe.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 4918c47029ecdea2deab4b0f9336ca4a8bb12c28b72b2cec397d98664b94c771  libstrophe-0.10.1.tar.gz
-sha256 82476f36ffd5e895a176013c0812166ba7b7d99f3d536fc7f5ed2e33e9f74a08  MIT-LICENSE.txt
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  GPL-LICENSE.txt
+sha256  5bf0bbc555cb6059008f1b748370d4d2ee1e1fabd3eeab68475263556405ba39  libstrophe-0.10.1.tar.gz
+sha256  82476f36ffd5e895a176013c0812166ba7b7d99f3d536fc7f5ed2e33e9f74a08  MIT-LICENSE.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  GPL-LICENSE.txt
-- 
2.30.0
