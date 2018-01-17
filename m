From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Wed, 17 Jan 2018 12:08:24 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2018-01-16
In-Reply-To: <20180117070031.EC9E0208EE@mail.free-electrons.com>
References: <20180117070031.EC9E0208EE@mail.free-electrons.com>
Message-ID: <20180117120824.46377330@x230.trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
On Wed, 17 Jan 2018 08:00:31 +0100 (CET)
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello,
> 
> This is the list of Buildroot build failures that occured on
> 2018-01-16, and for which you are a registered architecture developer
> or package developer. Please help us improving the quality of
> Buildroot by investigating those build failures and sending patches to
> fix them. Thanks!
> 
> Results for the '2017.11.x' branch
> ==================================
> 
> Build failures related to your packages:
> 
>        nios2 |             python-pyqt-4.11.3 |
> http://autobuild.buildroot.net/results/4757f76e56240302cbccf2d460493d13eefb0e56
> 
> -- 
> http://autobuild.buildroot.net

It's strange I have this result instead of the build failure mentioned
in the log :

>>> python-pyqt 4.11.3 Configuring
rm -f
-f /home/toolchains/misc/buildroot/buildroot/output/build/python-pyqt-4.11.3/qtdetail.out
echo Open Source
>> /home/toolchains/misc/buildroot/buildroot/output/build/python-pyqt-4.11.3/qtdetail.out
>> echo shared
>> >> /home/toolchains/misc/buildroot/buildroot/output/build/python-pyqt-4.11.3/qtdetail.out
>> >> echo PyQt_Accessibility
>> >> >> /home/toolchains/misc/buildroot/buildroot/output/build/python-pyqt-4.11.3/qtdetail.out  
echo PyQt_SessionManager
>> /home/toolchains/misc/buildroot/buildroot/output/build/python-pyqt-4.11.3/qtdetail.out
>> echo PyQt_Shortcut
>> >> /home/toolchains/misc/buildroot/buildroot/output/build/python-pyqt-4.11.3/qtdetail.out  
echo PyQt_RawFont
>> /home/toolchains/misc/buildroot/buildroot/output/build/python-pyqt-4.11.3/qtdetail.out
>> echo PyQt_OpenSSL
>> >> /home/toolchains/misc/buildroot/buildroot/output/build/python-pyqt-4.11.3/qtdetail.out 
(cd /home/toolchains/misc/buildroot/buildroot/output/build/python-pyqt-4.11.3;
PATH="/home/toolchains/misc/buildroot/buildroot/output/host/bin:/home/toolchains/misc/buildroot/buildroot/output/host/sbin:/home/gwe/bin:/usr/x86_64-pc-linux-gnu/gcc-bin/6.4.0:/usr/lib/llvm/4/bin:/usr/local/bin:/usr/bin:/bin:/opt/bin:/usr/x86_64-pc-linux-gnu/gnat-gcc-bin/4.3:/usr/libexec/gnat-gcc/x86_64-pc-linux-gnu/4.3:/usr/lib64/subversion/bin:/usr/local/bin://home/gwe/bin:/home/gwe/apps/bin:/opt/eagle-6.4.0/bin:/home/gwe/.local/bin:/usr/local/bin://home/gwe/bin:/home/gwe/apps/bin:/opt/eagle-6.4.0/bin:/home/gwe/.local/bin:/usr/local/bin://home/gwe/bin:/home/gwe/apps/bin:/opt/eagle-6.4.0/bin:/home/gwe/.local/bin:/usr/local/bin://home/gwe/bin:/home/gwe/apps/bin:/opt/eagle-6.4.0/bin:/home/gwe/.local/bin"
PATH="/home/toolchains/misc/buildroot/buildroot/output/host/bin:/home/toolchains/misc/buildroot/buildroot/output/host/sbin:/home/gwe/bin:/usr/x86_64-pc-linux-gnu/gcc-bin/6.4.0:/usr/lib/llvm/4/bin:/usr/local/bin:/usr/bin:/bin:/opt/bin:/usr/x86_64-pc-linux-gnu/gnat-gcc-bin/4.3:/usr/libexec/gnat-gcc/x86_64-pc-linux-gnu/4.3:/usr/lib64/subversion/bin:/usr/local/bin://home/gwe/bin:/home/gwe/apps/bin:/opt/eagle-6.4.0/bin:/home/gwe/.local/bin:/usr/local/bin://home/gwe/bin:/home/gwe/apps/bin:/opt/eagle-6.4.0/bin:/home/gwe/.local/bin:/usr/local/bin://home/gwe/bin:/home/gwe/apps/bin:/opt/eagle-6.4.0/bin:/home/gwe/.local/bin:/usr/local/bin://home/gwe/bin:/home/gwe/apps/bin:/opt/eagle-6.4.0/bin:/home/gwe/.local/bin"
AR="/home/toolchains/misc/buildroot/buildroot/output/host/bin/nios2-linux-ar"
AS="/home/toolchains/misc/buildroot/buildroot/output/host/bin/nios2-linux-as"
LD="/home/toolchains/misc/buildroot/buildroot/output/host/bin/nios2-linux-ld"
NM="/home/toolchains/misc/buildroot/buildroot/output/host/bin/nios2-linux-nm"
CC="/home/toolchains/misc/buildroot/buildroot/output/host/bin/nios2-linux-gcc"
GCC="/home/toolchains/misc/buildroot/buildroot/output/host/bin/nios2-linux-gcc"
CPP="/home/toolchains/misc/buildroot/buildroot/output/host/bin/nios2-linux-cpp"
CXX="/home/toolchains/misc/buildroot/buildroot/output/host/bin/nios2-linux-g++"
FC="/home/toolchains/misc/buildroot/buildroot/output/host/bin/nios2-linux-gfortran"
F77="/home/toolchains/misc/buildroot/buildroot/output/host/bin/nios2-linux-gfortran"
RANLIB="/home/toolchains/misc/buildroot/buildroot/output/host/bin/nios2-linux-ranlib"
READELF="/home/toolchains/misc/buildroot/buildroot/output/host/bin/nios2-linux-readelf"
STRIP="/home/toolchains/misc/buildroot/buildroot/output/host/bin/nios2-linux-strip"
OBJCOPY="/home/toolchains/misc/buildroot/buildroot/output/host/bin/nios2-linux-objcopy"
OBJDUMP="/home/toolchains/misc/buildroot/buildroot/output/host/bin/nios2-linux-objdump"
AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as"
CC_FOR_BUILD="/usr/x86_64-pc-linux-gnu/gcc-bin/6.4.0/gcc"
GCC_FOR_BUILD="/usr/x86_64-pc-linux-gnu/gcc-bin/6.4.0/gcc"
CXX_FOR_BUILD="/usr/x86_64-pc-linux-gnu/gcc-bin/6.4.0/g++"
LD_FOR_BUILD="/usr/bin/ld"
CPPFLAGS_FOR_BUILD="-I/home/toolchains/misc/buildroot/buildroot/output/host/include"
CFLAGS_FOR_BUILD="-O2
-I/home/toolchains/misc/buildroot/buildroot/output/host/include"
CXXFLAGS_FOR_BUILD="-O2
-I/home/toolchains/misc/buildroot/buildroot/output/host/include"
LDFLAGS_FOR_BUILD="-L/home/toolchains/misc/buildroot/buildroot/output/host/lib
-Wl,-rpath,/home/toolchains/misc/buildroot/buildroot/output/host/lib"
FCFLAGS_FOR_BUILD=""
DEFAULT_ASSEMBLER="/home/toolchains/misc/buildroot/buildroot/output/host/bin/nios2-linux-as"
DEFAULT_LINKER="/home/toolchains/misc/buildroot/buildroot/output/host/bin/nios2-linux-ld"
CPPFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64" CFLAGS="-D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os "
CXXFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -Os " LDFLAGS="" FCFLAGS=" -Os " FFLAGS=" -Os "
PKG_CONFIG="/home/toolchains/misc/buildroot/buildroot/output/host/bin/pkg-config"
STAGING_DIR="/home/toolchains/misc/buildroot/buildroot/output/host/nios2-buildroot-linux-gnu/sysroot"
INTLTOOL_PERL=/usr/bin/perl /home/toolchains/misc/buildroot/buildroot/output/host/bin/python
configure-ng.py
--bindir /home/toolchains/misc/buildroot/buildroot/output/target/usr/bin
--destdir /home/toolchains/misc/buildroot/buildroot/output/target/usr/lib/python3.6/site-packages
--qmake /home/toolchains/misc/buildroot/buildroot/output/host/bin/qmake
--sysroot /home/toolchains/misc/buildroot/buildroot/output/host/nios2-buildroot-linux-gnu/sysroot/usr
-w --confirm-license --no-designer-plugin --no-docstrings
--no-sip-files --qt-flavor=WS_QWS ) Querying qmake about your Qt
installation... Determining the details of your Qt
installation... /home/toolchains/misc/buildroot/buildroot/output/host/bin/qmake
-o qtdetail.mk qtdetail.pro QMAKESPEC has not been set, so
configuration cannot be deduced. Error processing project file:
qtdetail.pro Error: Failed to determine the detail of your Qt
installation. Try again using the --verbose flag to see more detail
about the problem. make: ***
[package/pkg-generic.mk:227: /home/toolchains/misc/buildroot/buildroot/output/build/python-pyqt-4.11.3/.stamp_configured]
Error 1

Gwenhael
