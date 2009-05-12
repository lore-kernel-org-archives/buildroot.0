From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 12 May 2009 12:20:48 +0200
Subject: [Buildroot] [PATCH] fix gcc install problem on	
	powerpc+soft-float+install_libgcc_s
In-Reply-To: <49FFF317.D58A.0070.1@alliedtelesis.co.nz> (angus salkeld's
	message of "Tue\, 05 May 2009 08\:04\:39 +1200")
References: <49FFF317.D58A.0070.1@alliedtelesis.co.nz>
Message-ID: <87eiuu7hbz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "angus" == angus salkeld <angus.salkeld@alliedtelesis.co.nz> writes:

 angus> Hi
 angus> I am building with:
 angus> gcc-4.3.3
 angus> powerpc-8540
 angus> soft-float
 angus> install libgcc_s
 angus> install libstd++

 angus> I get the following error:

Strange - I cannot reproduce it here - Could you send your config
please? With your other patch applied a
ppc405/softfloat/libgcc_2/libstdc++ config builds here, and I don't
see any */lib/nof dirs.

BR2_powerpc_405=y
BR2_KERNEL_HEADERS_2_6_29=y
BR2_UCLIBC_VERSION_0_9_30_1=y
BR2_BINUTILS_VERSION_2_19_1=y
BR2_GCC_VERSION_4_3_3=y
BR2_TOOLCHAIN_SYSROOT=y
BR2_GCC_SHARED_LIBGCC=y
BR2_SOFT_FLOAT=y
BR2_GCC_CROSS_CXX=y
BR2_INSTALL_LIBSTDCPP=y

-- 
Bye, Peter Korsgaard
