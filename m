From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 23 Apr 2013 08:59:23 +0200
Subject: [Buildroot] [git commit] busybox: move patches to new model
Message-ID: <20130423070519.A8B6D9B7E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=246d12b5b49c045b6c74ea18ebb53778692a7e3f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On commit 5538e4766201aa0c1c23721cfc99cbbde595964b the versioned package
patches changed the directory structure but the packages weren't fixed.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../busybox-1.19.4-udhcp.patch                     |    0
 .../busybox-1.20.2-kernel_ver.patch                |    0
 .../busybox-1.20.2-ntpd.patch                      |    0
 .../busybox-1.20.2-pkg-config-selinux.patch        |    0
 .../busybox-1.20.2-sys-resource.patch              |    0
 .../busybox-1.21.0-mdev.patch                      |    0
 .../busybox-1.21.0-platform.patch                  |    0
 .../busybox-1.21.0-xz.patch                        |    0
 8 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/busybox/busybox-1.19.4/busybox-1.19.4-udhcp.patch b/package/busybox/1.19.4/busybox-1.19.4-udhcp.patch
similarity index 100%
rename from package/busybox/busybox-1.19.4/busybox-1.19.4-udhcp.patch
rename to package/busybox/1.19.4/busybox-1.19.4-udhcp.patch
diff --git a/package/busybox/busybox-1.20.2/busybox-1.20.2-kernel_ver.patch b/package/busybox/1.20.2/busybox-1.20.2-kernel_ver.patch
similarity index 100%
rename from package/busybox/busybox-1.20.2/busybox-1.20.2-kernel_ver.patch
rename to package/busybox/1.20.2/busybox-1.20.2-kernel_ver.patch
diff --git a/package/busybox/busybox-1.20.2/busybox-1.20.2-ntpd.patch b/package/busybox/1.20.2/busybox-1.20.2-ntpd.patch
similarity index 100%
rename from package/busybox/busybox-1.20.2/busybox-1.20.2-ntpd.patch
rename to package/busybox/1.20.2/busybox-1.20.2-ntpd.patch
diff --git a/package/busybox/busybox-1.20.2/busybox-1.20.2-pkg-config-selinux.patch b/package/busybox/1.20.2/busybox-1.20.2-pkg-config-selinux.patch
similarity index 100%
rename from package/busybox/busybox-1.20.2/busybox-1.20.2-pkg-config-selinux.patch
rename to package/busybox/1.20.2/busybox-1.20.2-pkg-config-selinux.patch
diff --git a/package/busybox/busybox-1.20.2/busybox-1.20.2-sys-resource.patch b/package/busybox/1.20.2/busybox-1.20.2-sys-resource.patch
similarity index 100%
rename from package/busybox/busybox-1.20.2/busybox-1.20.2-sys-resource.patch
rename to package/busybox/1.20.2/busybox-1.20.2-sys-resource.patch
diff --git a/package/busybox/busybox-1.21.0/busybox-1.21.0-mdev.patch b/package/busybox/1.21.0/busybox-1.21.0-mdev.patch
similarity index 100%
rename from package/busybox/busybox-1.21.0/busybox-1.21.0-mdev.patch
rename to package/busybox/1.21.0/busybox-1.21.0-mdev.patch
diff --git a/package/busybox/busybox-1.21.0/busybox-1.21.0-platform.patch b/package/busybox/1.21.0/busybox-1.21.0-platform.patch
similarity index 100%
rename from package/busybox/busybox-1.21.0/busybox-1.21.0-platform.patch
rename to package/busybox/1.21.0/busybox-1.21.0-platform.patch
diff --git a/package/busybox/busybox-1.21.0/busybox-1.21.0-xz.patch b/package/busybox/1.21.0/busybox-1.21.0-xz.patch
similarity index 100%
rename from package/busybox/busybox-1.21.0/busybox-1.21.0-xz.patch
rename to package/busybox/1.21.0/busybox-1.21.0-xz.patch
