From: Mahanteshwari Hiremath <Mahanteshwari.Hiremath@lnties.com>
Date: Tue, 6 Dec 2011 10:49:00 +0000
Subject: [Buildroot] Kernel panic!
In-Reply-To: <87y5uqqcz3.fsf@macbook.be.48ers.dk>
References: <1F383CDA589639468828C7E2B75EDE9D096BB9DE@POCITMSEXMB02.LntUniverse.com>,
 <87y5uqqcz3.fsf@macbook.be.48ers.dk>
Message-ID: <1F383CDA589639468828C7E2B75EDE9D096BBA18@POCITMSEXMB02.LntUniverse.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi ,
    I am trying use buildroot built root file system for my embedded target board. I am able to boot my system partially, it stops at some point saying
 /sbin/init: cannot load libc.so.0, kernel panic-not syncing:Attempted to kill init

I tried hard to solve this, but unable to fix this error(I don't have any understanding about buildroot code).

I want my embedded board to boot with buildroot rootfile sytem without any problem.



Regards,
Mahanteshwari Hiremath.


________________________________________
From: Peter Korsgaard [jacmet at gmail.com] on behalf of Peter Korsgaard [jacmet at sunsite.dk]
Sent: Tuesday, December 06, 2011 2:43 PM
To: Mahanteshwari Hiremath; buildroot at uclibc.org
Cc: uclibc at uclibc.org
Subject: Re: Kernel panic!

>>>>> "Mahanteshwari" == Mahanteshwari Hiremath <Mahanteshwari.Hiremath@lnties.com> writes:

 Mahanteshwari> Hi,

 Mahanteshwari>     I am trying use buildroot built root file system for
 Mahanteshwari>  my embedded target board. I am able to boot my system
 Mahanteshwari>  partially, it stops at some point saying /sbin/init:
 Mahanteshwari>  cannot load libc.so.0, kernel panic-not
 Mahanteshwari>  syncing:Attempted to kill init

Buildroot related questions should go to the buildroot list (addressed
in this mail). Please reply (only to the buildroot list) with more
details about your system, E.G. your hw platform and your buildroot
version and configuration (run make savedefconfig and send the defconfig
file).

Thanks.

--
Bye, Peter Korsgaard


****************************************************************


Hi,
        below is the defconfig file contents, buildroot version "buildroot-2011.08 ", hardware platform- X86(PPM-GX500,GEODE)


R2_x86_geode=y
BR2_HOST_DIR="$(BASE_DIR)/staging"
BR2_DEPRECATED=y
BR2_HAVE_DEVFILES=y
BR2_KERNEL_HEADERS_2_6_39=y
# BR2_GCC_SHARED_LIBGCC is not set
BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PTHREADS_OLD=y
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
BR2_PACKAGE_GCC_TARGET=y
BR2_PACKAGE_MAKE=y
BR2_PACKAGE_QT=y
BR2_PACKAGE_QT_LICENSE_APPROVED=y
BR2_PACKAGE_QT_QT3SUPPORT=y
BR2_PACKAGE_QT_MOUSE_PC=y
BR2_PACKAGE_QT_KEYBOARD_LINUXINPUT=y
BR2_PACKAGE_OPENSSL=y
BR2_PACKAGE_FONTCONFIG=y
BR2_PACKAGE_LIBPNG=y
BR2_PACKAGE_PIXMAN=y
BR2_PACKAGE_SYSVINIT=y
BR2_TARGET_ROOTFS_EXT2=y
# BR2_TARGET_ROOTFS_TAR is not set
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="/home/.config"




Regards,
Mahanteshwari Hiremath.




Larsen & Toubro Limited

www.larsentoubro.com

This Email may contain confidential or privileged information for the intended recipient (s) If you are not the intended recipient, please do not use or disseminate the information, notify the sender and delete it from your system.
