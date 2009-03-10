From: IaMaPlAyEr <iamaplayer@gmail.com>
Date: Tue, 10 Mar 2009 12:13:12 +0800
Subject: [Buildroot] [buildroot] help! stopped at gcc build
Message-ID: <2ae8403e0903092113g94dd0b8x19a38947031dc2a6@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi,all

when i build buildroot, some error appeared.
i select

Target Architecture (arm)  --->
Target Architecture Variant (arm920t)  --->
Target ABI (EABI)  --->


error message:

/home/havef/src/buildroot/toolchain_build_arm/gcc-4.3.3/libgcc/../gcc/crtstuff.c:
In function '__do_global_dtors_aux':
/home/havef/src/buildroot/toolchain_build_arm/gcc-4.3.3/libgcc/../gcc/crtstuff.c:306:
error: '__DTOR_LIST__' undeclared (first use in this function)
/home/havef/src/buildroot/toolchain_build_arm/gcc-4.3.3/libgcc/../gcc/crtstuff.c:306:
error: (Each undeclared identifier is reported only once
/home/havef/src/buildroot/toolchain_build_arm/gcc-4.3.3/libgcc/../gcc/crtstuff.c:306:
error: for each function it appears in.)
make[2]: *** [crtbegin.o] Error 1
make[2]: Leaving directory
`/home/havef/src/buildroot/toolchain_build_arm/gcc-4.3.3-initial/arm-linux-uclibc/libgcc'
make[1]: *** [all-target-libgcc] Error 2
make[1]: Leaving directory
`/home/havef/src/buildroot/toolchain_build_arm/gcc-4.3.3-initial'
make: ***
[/home/havef/src/buildroot/toolchain_build_arm/gcc-4.3.3-initial/.compiled]
Error 2



great thanks for your tips!
-- 
--
Sincerly,

HaveF
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090310/4ed29344/attachment.htm>
