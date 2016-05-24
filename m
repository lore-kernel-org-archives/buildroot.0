From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 May 2016 17:32:47 +0200
Subject: [Buildroot] [git commit] toolchain-external: correct hash value for
	Linaro AArch64 toolchain source
Message-ID: <20160524153400.5B6D281E16@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9891e5cbfa35c660362c032a06d1270f3ff37479
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The aarch64 Linaro toolchain source hash is not correct, probably due
to a copy/paste error. The new hash has been verified by downloading
the tarball, validating the signature, and computing the hash.

Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/toolchain-external.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index fcd735b..9be3c7a 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -42,7 +42,7 @@ sha256 4bc9d86390f8fa67a693ba4768ba5b12faaf7dd37c706c05ccd9321e765226e4  gcc-lin
 sha256 bf5d3111dad5aa9aef0e955875fb7fc9e918cb24519af7014dd67a9e581a49b1  gcc-linaro-armeb-linux-gnueabihf-4.9-2014.09_src.tar.bz2
 sha256 f488caf46680b0c0a16b66b43fbfd157e3d6389df18e957983132e89529a9804  gcc-linaro-5.3-2016.02-x86_64_armeb-linux-gnueabihf.tar.xz
 sha256 3954f496ab01de67241109e82abfaa9b7625fdab4f05e79e7902e9814a07b832  gcc-linaro-aarch64-linux-gnu-4.9-2014.09_linux.tar.xz
-sha256 3954f496ab01de67241109e82abfaa9b7625fdab4f05e79e7902e9814a07b832  gcc-linaro-aarch64-linux-gnu-4.9-2014.09_src.tar.bz2
+sha256 a7b8f842fdc9d9be22ca4e0c999429780fc6f16ea798b032421b5ec0cfa53b3e  gcc-linaro-aarch64-linux-gnu-4.9-2014.09_src.tar.bz2
 sha256 1c85af550bedd378be583317b4abbdc96342b42c19fb19873c13d3093ff694ad  gcc-linaro-5.3-2016.02-x86_64_aarch64-linux-gnu.tar.xz
 
 # Codescape toolchains from Imagination Technologies
