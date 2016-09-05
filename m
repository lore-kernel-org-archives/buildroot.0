From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Sep 2016 22:39:21 +0200
Subject: [Buildroot] [git commit] package/amd-catalyst: fix legal-info
Message-ID: <20160905203925.284658218D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1d0ff54c1464444c39c310ef9108794ac4547bb4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/4f1/4f1e9b4bf43add4712e82d4a58e633abb2a7d2b8/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/amd-catalyst/amd-catalyst.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/amd-catalyst/amd-catalyst.mk b/package/amd-catalyst/amd-catalyst.mk
index 3097353..5636f81 100644
--- a/package/amd-catalyst/amd-catalyst.mk
+++ b/package/amd-catalyst/amd-catalyst.mk
@@ -10,7 +10,7 @@ AMD_CATALYST_SITE = http://www2.ati.com/drivers/linux
 AMD_CATALYST_DL_OPTS = --referer='http://support.amd.com'
 AMD_CATALYST_SOURCE = amd-catalyst-$(AMD_CATALYST_VERSION)-linux-installer-$(AMD_CATALYST_VERBOSE_VER)-x86.x86_64.zip
 AMD_CATALYST_LICENSE = AMD Software License
-AMD_CATALYST_LICENSE_FILES = LICENSE.txt
+AMD_CATALYST_LICENSE_FILES = LICENSE.TXT
 AMD_CATALYST_INSTALL_STAGING = YES
 AMD_CATALYST_SUFFIX = $(if $(BR2_x86_64),_64)
 AMD_CATALYST_ARCH_DIR = $(@D)/arch/x86$(AMD_CATALYST_SUFFIX)
