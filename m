From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Oct 2013 23:06:15 +0200
Subject: [Buildroot] [git commit] package/rpi-userland: rename patches
Message-ID: <20131009210741.610CC9AF8C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c6ac31a623123ce450afc41d9c0b03f56b8e9176
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rename patches to follow standard naming scheme.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ... => rpi-userland-000-add-pkgconfig-files.patch} |    0
 ...ake-vmcs.cmake-allow-to-override-VMCS_IN.patch} |    0
 2 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/rpi-userland/rpi-userland-add-pkgconfig-files.patch b/package/rpi-userland/rpi-userland-000-add-pkgconfig-files.patch
similarity index 100%
rename from package/rpi-userland/rpi-userland-add-pkgconfig-files.patch
rename to package/rpi-userland/rpi-userland-000-add-pkgconfig-files.patch
diff --git a/package/rpi-userland/rpi-userland-makefiles-0001-cmake-vmcs.cmake-allow-to-override-VMCS_IN.patch b/package/rpi-userland/rpi-userland-001-makefiles-cmake-vmcs.cmake-allow-to-override-VMCS_IN.patch
similarity index 100%
rename from package/rpi-userland/rpi-userland-makefiles-0001-cmake-vmcs.cmake-allow-to-override-VMCS_IN.patch
rename to package/rpi-userland/rpi-userland-001-makefiles-cmake-vmcs.cmake-allow-to-override-VMCS_IN.patch
