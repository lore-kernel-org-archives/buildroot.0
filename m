From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 10 Mar 2021 20:18:02 +0100
Subject: [Buildroot] [PATCH 1/1] package/avrdude: fix tarball hash
Message-ID: <20210310191802.264463-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tarball hash is broken since commit
03fa36df7e6aca0f4a1c8ae2fe691c0cda6ddc7a

Fixes:
 - http://autobuild.buildroot.org/results/712167620d46ed0175da89dfe77a8db2534b925d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/avrdude/avrdude.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/avrdude/avrdude.hash b/package/avrdude/avrdude.hash
index c7b4bf85bc..e0f11f8e73 100644
--- a/package/avrdude/avrdude.hash
+++ b/package/avrdude/avrdude.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a74532a61d07e43fc598ade4202e9a8c8697bce3e6031c5be6f51da651595f99  avrdude-r1450-br1.tar.gz
+sha256  28887d8cdd31c3090f5d49c297abd859a845eafc36104185e7584dbef0920a19  avrdude-r1450-br1.tar.gz
 sha256  201babc7da198873304a77a30dbfc7ca449c9bba52df2dffa4cca0009dbdfcb2  avrdude/COPYING
-- 
2.30.0
