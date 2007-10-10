From: =?ISO-8859-1?Q?Kim_Str=F8ger?= <ks@sfktech.com>
Date: Wed, 10 Oct 2007 09:17:57 +0200
Subject: [Buildroot] Problems building toolchain
In-Reply-To: <20071009163451.GB16889@aon.at>
References: <470B9BAB.3050407@sfktech.com> <20071009163451.GB16889@aon.at>
Message-ID: <470C7CA5.9000103@sfktech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net




Bernhard Fischer wrote:
> On Tue, Oct 09, 2007 at 05:18:03PM +0200, Kim Str?ger wrote:
>
>   
>> How do I get passed this point ?
>>     
>
> What did you specify as your target CPU and other settings? If in doubt
> attach your toplevel .config, please.
>
> Also please do
> $ make V=1
> and show me the arguments used for the command that fails.
>   


The .config

BR2_HAVE_DOT_CONFIG=y
BR2_VERSION="0.10.0-svn"
# BR2_alpha is not set
BR2_arm=y
# BR2_armeb is not set
# BR2_avr32 is not set
# BR2_cris is not set
# BR2_ia64 is not set
# BR2_i386 is not set
# BR2_m68k is not set
# BR2_mips is not set
# BR2_mipsel is not set
# BR2_nios2 is not set
# BR2_powerpc is not set
# BR2_s390 is not set
# BR2_sh is not set
# BR2_sh64 is not set
# BR2_sparc is not set
# BR2_sparc64 is not set
# BR2_x86_64 is not set
# BR2_generic_arm is not set
BR2_arm7tdmi=y
# BR2_arm610 is not set
# BR2_arm710 is not set
# BR2_arm720t is not set
# BR2_arm920t is not set
# BR2_arm922t is not set
# BR2_arm926t is not set
# BR2_arm10t is not set
# BR2_arm1136jf_s is not set
# BR2_arm1176jz_s is not set
# BR2_arm1176jzf_s is not set
# BR2_sa110 is not set
# BR2_sa1100 is not set
# BR2_xscale is not set
# BR2_iwmmxt is not set
BR2_ARM_TYPE="ARM7TDMI"
BR2_ARM_OABI=y
# BR2_ARM_EABI is not set
BR2_ARCH="arm"
BR2_ENDIAN="LITTLE"
BR2_GCC_TARGET_TUNE="arm7tdmi"



  $make V=1

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
C compiler '/usr/lib/distcc/bin/gcc'
C compiler version '4.1.2':                     Ok
C++ compiler '/usr/lib/distcc/bin/g++'
C++ compiler version '4.1.2':                   Ok
bison installed:                                Ok
flex installed:                                 Ok
gettext installed:                              Ok
makeinfo installed:                             Ok
Build system dependencies:                      Ok


and it is when I do the make that I get the error.
