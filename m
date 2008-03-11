From: Habib Bouaziz-Viallet <habib.bouaziz@gmail.com>
Date: Tue, 11 Mar 2008 13:27:25 +0100
Subject: [Buildroot] build for AT91 fails
Message-ID: <d449ded70803110527t3ea96b09r78dec92cb72beea3@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all !

I'm facing a problem with targeting 'at91sam9261ek'



Checking build system dependencies:
BUILDROOT_DL_DIR clean:                         Ok
CC clean:                                       Ok
CXX clean:                                      Ok
CPP clean:                                      Ok
CFLAGS clean:                                   Ok
INCLUDES clean:                                 Ok
CXXFLAGS clean:                                 Ok
which installed:                                Ok
sed works:                                      Ok (/bin/sed)
GNU make version '3.81':                        Ok
C compiler '/usr/bin/gcc'
C compiler version '4.1.2':                     Ok
C++ compiler '/usr/bin/g++'
C++ compiler version '4.1.2':                   Ok
bison installed:                                Ok
flex installed:                                 Ok
gettext installed:                              Ok
makeinfo installed:                             Ok
Build system dependencies:                      Ok

rm -rf /home/habib/PROJETS/PERSO/buildroot/project_build_arm/AT91_SBC/buildroot-config
mkdir -p /home/habib/PROJETS/PERSO/buildroot/project_build_arm/AT91_SBC
cp -dpRf package/config/buildroot-config
/home/habib/PROJETS/PERSO/buildroot/project_build_arm/AT91_SBC/buildroot-config
toolchain/patch-kernel.sh
/home/habib/PROJETS/PERSO/buildroot/project_build_arm/AT91_SBC/linux-2.6.24
toolchain/kernel-headers \
                linux-2.6.24-\*.patch{,.gz,.bz2}
toolchain/patch-kernel.sh
/home/habib/PROJETS/PERSO/buildroot/project_build_arm/AT91_SBC/linux-2.6.24
target/device/Atmel/at91sam9261ek/kernel-patches linux-2.6.24-\*.patch
;
Aborting.  'target/device/Atmel/at91sam9261ek/kernel-patches' is not a
directory.
make: *** [/home/habib/PROJETS/PERSO/buildroot/project_build_arm/AT91_SBC/linux-2.6.24/.patched]
Erreur 1

May be ../at91sam9261ek/kernel-patches is a symlink ?

please help.

-- 
M. Bouaziz-Viallet
