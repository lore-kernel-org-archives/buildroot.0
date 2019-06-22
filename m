From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Jun 2019 17:06:08 +0200
Subject: [Buildroot] [git commit] package/qemu: move patches to a per
 version directory
Message-ID: <20190622154514.2C36A8280A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9c1f51443782fe63950dfe2a9489b36c503953b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is done in preparation to the introduction of the support for a
different Qemu version, used on the C-SKY architecture.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch       | 0
 package/qemu/{ => 3.1.0}/0002-configure-improve-usbfs-check.patch         | 0
 2 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/qemu/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch b/package/qemu/3.1.0/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
similarity index 100%
rename from package/qemu/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
rename to package/qemu/3.1.0/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
diff --git a/package/qemu/0002-configure-improve-usbfs-check.patch b/package/qemu/3.1.0/0002-configure-improve-usbfs-check.patch
similarity index 100%
rename from package/qemu/0002-configure-improve-usbfs-check.patch
rename to package/qemu/3.1.0/0002-configure-improve-usbfs-check.patch
