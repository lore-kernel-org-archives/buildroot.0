From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sun, 6 Dec 2020 20:26:22 +0100
Subject: [Buildroot] [rust-bin / BR 2020.11] some hashes are missing
Message-ID: <CAB0FRsuq-kj82Fifshw6iAcvz4vcSt9xeP_Dv1qBoE3+FhNJCA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>> host-rust-bin 1.45.2 Downloading
rust-1.45.2-x86_64-unknown-linux-gnu.tar.xz: OK (sha256:
39455d1ebd6f386e50748f566e1b37780f236c1f3cbc869690653662beca1ea9)
ERROR: No hash found for rust-std-1.45.2-i586-unknown-linux-gnu.tar.xz


minimal defconfig:
BR2_i386=y
BR2_x86_i586=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_TARGET_GENERIC_GETTY_PORT="tty1"
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XSERVER_XORG_SERVER=y
BR2_PACKAGE_LIBGTK3=y

note: on master, same issue with rust-bin version 1.48.0

Fran?ois
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201206/0e271190/attachment.html>
