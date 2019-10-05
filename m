From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 05 Oct 2019 18:14:21 +0000
Subject: [Buildroot] [Bug 11776] qt5webengine 5.12.2 build failed with arm
 toolchain and linaro toolchain
In-Reply-To: <bug-11776-163@https.bugs.busybox.net/>
References: <bug-11776-163@https.bugs.busybox.net/>
Message-ID: <bug-11776-163-3LGvTEIatl@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11776

--- Comment #4 from Bernd Kuhls <bernd.kuhls@t-online.de> ---
(In reply to fazibear from comment #2)

Today I hit this bug with buildroot master (37be55a5db) and this defconfig:

BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_BINUTILS_VERSION_2_32_X=y
BR2_GCC_VERSION_9_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
BR2_PACKAGE_MESA3D_OPENGL_GLX=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_QT5=y
BR2_PACKAGE_QT5WEBENGINE=y
BR2_PACKAGE_XORG7=y

-- 
You are receiving this mail because:
You are on the CC list for the bug.
