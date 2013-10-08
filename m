From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  9 Oct 2013 00:09:47 +0200
Subject: [Buildroot] [PATCH 01/11] package/rpi-userland: rename patches
In-Reply-To: <cover.1381269937.git.yann.morin.1998@free.fr>
References: <cover.1381269937.git.yann.morin.1998@free.fr>
Message-ID: <a9f94140f940ceb096089e477d0c173b648b66bf.1381269937.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Rename patches to follow standard naming scheme.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 ...d-pkgconfig-files.patch => rpi-userland-000-add-pkgconfig-files.patch} | 0
 ...erland-001-makefiles-cmake-vmcs.cmake-allow-to-override-VMCS_IN.patch} | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename package/rpi-userland/{rpi-userland-add-pkgconfig-files.patch => rpi-userland-000-add-pkgconfig-files.patch} (100%)
 rename package/rpi-userland/{rpi-userland-makefiles-0001-cmake-vmcs.cmake-allow-to-override-VMCS_IN.patch => rpi-userland-001-makefiles-cmake-vmcs.cmake-allow-to-override-VMCS_IN.patch} (100%)

diff --git a/package/rpi-userland/rpi-userland-add-pkgconfig-files.patch b/package/rpi-userland/rpi-userland-000-add-pkgconfig-files.patch
similarity index 100%
rename from package/rpi-userland/rpi-userland-add-pkgconfig-files.patch
rename to package/rpi-userland/rpi-userland-000-add-pkgconfig-files.patch
diff --git a/package/rpi-userland/rpi-userland-makefiles-0001-cmake-vmcs.cmake-allow-to-override-VMCS_IN.patch b/package/rpi-userland/rpi-userland-001-makefiles-cmake-vmcs.cmake-allow-to-override-VMCS_IN.patch
similarity index 100%
rename from package/rpi-userland/rpi-userland-makefiles-0001-cmake-vmcs.cmake-allow-to-override-VMCS_IN.patch
rename to package/rpi-userland/rpi-userland-001-makefiles-cmake-vmcs.cmake-allow-to-override-VMCS_IN.patch
-- 
1.8.1.2
