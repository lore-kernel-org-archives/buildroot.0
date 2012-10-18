From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Thu, 18 Oct 2012 16:57:11 +0200
Subject: [Buildroot] filename format for kernel patches when using kernel
	from git ?
Message-ID: <C22CB8643B1E42C898B890C9A3A7539F@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi
 
(2012.08)
 
I can't figure out what the filename should be for patches i want to be applied:
 
i have my patch named : 76e10d158efb6d4516018846f60c2ab5501900bc.patch
and it is under /home/buildroot12git/board/kernel-patches
 
This is what i have in my .config:
 
#
# Kernel
#
BR2_LINUX_KERNEL=y
# BR2_LINUX_KERNEL_3_6 is not set
# BR2_LINUX_KERNEL_SAME_AS_HEADERS is not set
# BR2_LINUX_KERNEL_CUSTOM_VERSION is not set
# BR2_LINUX_KERNEL_CUSTOM_TARBALL is not set
BR2_LINUX_KERNEL_CUSTOM_GIT=y
BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git"
BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="76e10d158efb6d4516018846f60c2ab5501900bc"
BR2_LINUX_KERNEL_VERSION="76e10d158efb6d4516018846f60c2ab5501900bc"
BR2_LINUX_KERNEL_PATCH="/home/buildroot12git/board/kernel-patches"
# BR2_LINUX_KERNEL_USE_DEFCONFIG is not set
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="34config"
# BR2_LINUX_KERNEL_UIMAGE is not set
# BR2_LINUX_KERNEL_APPENDED_UIMAGE is not set
BR2_LINUX_KERNEL_ZIMAGE=y
# BR2_LINUX_KERNEL_APPENDED_ZIMAGE is not set
# BR2_LINUX_KERNEL_VMLINUX is not set
# BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM is not set
# BR2_LINUX_KERNEL_DTS_SUPPORT is not set
# BR2_LINUX_KERNEL_INSTALL_TARGET is not set

Regards Johan
