From: Babarovic Ivica <ivica.babarovic@asist.si>
Date: Thu, 18 Oct 2007 20:22:55 +0200
Subject: [Buildroot] svn At revision 20289 breakage
Message-ID: <4717A47F.4000908@asist.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!



$ make all

Checking build system dependencies:
BUILDROOT_DL_DIR clean:                         Ok
CC clean:                                       Ok
CXX clean:                                      Ok
CPP clean:                                      Ok
CFLAGS clean:                                   Ok
INCLUDES clean:                                 Ok
CXXFLAGS clean:                                 Ok
which installed:                                Ok
sed works:                                      Ok (/usr/bin/sed)
GNU make version '3.81':                        Ok
C compiler '/usr/bin/gcc'
C compiler version '4.1.1':                     Ok
C++ compiler '/usr/bin/g++'
C++ compiler version '4.1.1':                   Ok
bison installed:                                Ok
flex installed:                                 Ok
gettext installed:                              Ok
makeinfo installed:                             Ok
Build system dependencies:                      Ok

rm -rf 
/home/ivo/src/mpc5200_binar/build-tools/buildroot/project_build_powerpc/cpu32/buildroot-config
mkdir -p 
/home/ivo/src/mpc5200_binar/build-tools/buildroot/project_build_powerpc/cpu32
cp -dpRf package/config/buildroot-config 
/home/ivo/src/mpc5200_binar/build-tools/buildroot/project_build_powerpc/cpu32/buildroot-config
cp -dpf  
/home/ivo/src/mpc5200_binar/build-tools/buildroot/project_build_powerpc/cpu32/linux-2.6.22.10/.config
cp: missing destination file operand after 
`/home/ivo/src/mpc5200_binar/build-tools/buildroot/project_build_powerpc/cpu32/linux-2.6.22.10/.config'
Try `cp --help' for more information.
make: *** 
[/home/ivo/src/mpc5200_binar/build-tools/buildroot/project_build_powerpc/cpu32/linux-2.6.22.10/.configured] 
Error 1
