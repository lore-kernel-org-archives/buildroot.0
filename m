From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Jul 2018 23:46:06 +0200
Subject: [Buildroot] [git commit] package/llvm: bump to version 6.0.1
Message-ID: <20180727214102.BA01D8A4EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=900fec702a5b2b6ca8ffc452eb1037f4a6b31f7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

http://releases.llvm.org/6.0.1/docs/ReleaseNotes.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Joseph Kogut <joseph.kogut@gmail.com>
Cc: Valentin Korenblit <valentinkorenblit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/llvm/llvm.hash | 2 +-
 package/llvm/llvm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/llvm/llvm.hash b/package/llvm/llvm.hash
index 93bdf2e20e..6a09e5804c 100644
--- a/package/llvm/llvm.hash
+++ b/package/llvm/llvm.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256 1ff53c915b4e761ef400b803f07261ade637b0c269d99569f18040f3dcee4408  llvm-6.0.0.src.tar.xz
+sha256 b6d6c324f9c71494c0ccaf3dac1f16236d970002b42bb24a6c9e1634f7d0f4e2  llvm-6.0.1.src.tar.xz
 sha256 abd4d8794808bacb1eb6924d49efafd9ab6eef88faaaeb5d3cfa13ee3670d672 LICENSE.TXT
diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index fb0ae4ce5c..756b46a865 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LLVM_VERSION = 6.0.0
+LLVM_VERSION = 6.0.1
 LLVM_SITE = http://llvm.org/releases/$(LLVM_VERSION)
 LLVM_SOURCE = llvm-$(LLVM_VERSION).src.tar.xz
 LLVM_LICENSE = NCSA
