From: Hebbar <gururajakr@sanyo.co.in>
Date: Thu, 20 Sep 2007 01:28:04 -0700 (PDT)
Subject: [Buildroot] sysroot not anabled even when BR2_GCC_VERSION_4_2_1 is
	selected
Message-ID: <12792950.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi All,

 I just tried latest buildroot snapshot and below is my buildroot config.
What i observed is that BR2_TOOLCHAIN_SYSROOT i snot selected even though i
have enabled gcc 4.2.1. Let me know if any one has a quickest solution. LEt
me know if anyone needs more info.

Regards
Gururaja

BR2_arm=y
BR2_arm926t=y
BR2_ARM_TYPE="ARM926T"
BR2_ARM_EABI=y
BR2_ARCH="arm"
BR2_ENDIAN="LITTLE"
BR2_GCC_TARGET_TUNE="arm9tdmi"


BR2_PREFER_STATIC_LIB=y


#

#
# Toolchain type
#
BR2_TOOLCHAIN_BUILDROOT=y
# BR2_TOOLCHAIN_EXTERNAL is not set
BR2_TOOLCHAIN_NORMAL=y
# BR2_TOOLCHAIN_ATMEL_AVR32 is not set



#
# Gcc Options
#
# BR2_GCC_VERSION_3_3_5 is not set
# BR2_GCC_VERSION_3_3_6 is not set
# BR2_GCC_VERSION_3_4_2 is not set
# BR2_GCC_VERSION_3_4_3 is not set
# BR2_GCC_VERSION_3_4_4 is not set
# BR2_GCC_VERSION_3_4_5 is not set
# BR2_GCC_VERSION_3_4_6 is not set
# BR2_GCC_VERSION_4_0_0 is not set
# BR2_GCC_VERSION_4_0_1 is not set
# BR2_GCC_VERSION_4_0_2 is not set
# BR2_GCC_VERSION_4_0_3 is not set
# BR2_GCC_VERSION_4_0_4 is not set
# BR2_GCC_VERSION_4_1_0 is not set
# BR2_GCC_VERSION_4_1_1 is not set
# BR2_GCC_VERSION_4_1_2 is not set
# BR2_GCC_VERSION_4_2_0 is not set
BR2_GCC_VERSION_4_2_1=y
# BR2_GCC_IS_SNAP is not set
BR2_GCC_VERSION="4.2.1"
# BR2_GCC_USE_SJLJ_EXCEPTIONS is not set



-- 
View this message in context: http://www.nabble.com/sysroot-not-anabled-even-when-BR2_GCC_VERSION_4_2_1-is-selected-tf4486096.html#a12792950
Sent from the BuildRoot mailing list archive at Nabble.com.
